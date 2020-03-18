import * as admin from "firebase-admin";
import {CallableContext} from "firebase-functions/lib/providers/https";
import * as functions from "firebase-functions";
import {AcceptAllPayload, Attendee, Lesson,} from "../types/lessons";
import {GlobalHistory, HistoryAttendee, HistoryAttendeesMap, UserHistory} from "../types/history";
import {FIREBASE_PROJECT_ID_TEST} from "../config";

const db = admin.firestore();

const getMondayOfCurrentWeek = () => {
    const date = new Date();
    date.setUTCHours(0);

    const day = date.getDay();
    return new Date(date.getFullYear(), date.getMonth(), date.getDate() + (day == 0?-6:1)-day ).getTime();
};

// TODO: remove rank when all versions are upgraded
const generateHistoryAttendee = ({email, name, imageUrl, grade, rank}: Attendee): HistoryAttendee => ({
    email,
    name,
    imageUrl,
    grade: !!grade ? grade : rank,
    weekCounter: {
        [getMondayOfCurrentWeek()]: {
            counter: admin.firestore.FieldValue.increment(1)
        }
    }
});

const generateUserHistory = ({attendees, ...lessonWithoutAttendees}: Lesson): UserHistory => ({
    attendedLessons: admin.firestore.FieldValue.arrayUnion({
        ...lessonWithoutAttendees,
        "timestamp": Date.now()
    })
});

const generateGlobalHistory = ({attendees, ...lessonDetails}: Lesson, historyAttendees: HistoryAttendeesMap): GlobalHistory => ({
    ...lessonDetails,
    totalWeekCounters: {
        [getMondayOfCurrentWeek()]: {
            counter: admin.firestore.FieldValue.increment(attendees.length)
        }
    },
    attendees: historyAttendees
});

const getTraceableAttendees = (attendees: Attendee[]) => {
    const adminConfig = JSON.parse(process.env.FIREBASE_CONFIG || '');
    console.log(`Firebase project id: [${adminConfig.projectId}]`);
    if(adminConfig.projectId === FIREBASE_PROJECT_ID_TEST) {
        return attendees;
    }
    console.log("Skip test users");
    return attendees.filter(attendee => !attendee.email.endsWith("@test.com"));
};

export const acceptAll = functions.https.onCall(({lesson}: AcceptAllPayload, context: CallableContext) => {
    const {
        id: lessonId,
        attendees,
    } = lesson;
    console.log(`Accepting [${attendees.length}] attendees for lesson with id [${lessonId}]`);
    // setup batch
    const batch = db.batch();

    const historyAttendees: { [key: string]: HistoryAttendee; } = {};
    const traceableAttendees = getTraceableAttendees(attendees);
    console.log("Attendees:", traceableAttendees.map(attendee => attendee.email));

    traceableAttendees.forEach((attendee) => {
        const {
            email,
        } = attendee;

        historyAttendees[email] = generateHistoryAttendee(attendee);

        const userHistoryRef = db.collection("users_history").doc(email);
        batch.set(userHistoryRef, generateUserHistory(lesson), {merge: true});
    });

    // update globalHistory
    const globalHistoryRef = db.collection("global_history").doc(lessonId);
    batch.set(globalHistoryRef, generateGlobalHistory(lesson, historyAttendees), {merge: true});

    // remove users from lessons
    const lessonRef = db.collection(`lesson_instances/${lesson.date}/instances`).doc(lessonId);
    batch.update(lessonRef, {
        "acceptedAttendees": admin.firestore.FieldValue.arrayUnion(...attendees),
        "attendees": admin.firestore.FieldValue.delete()
    });

    return batch.commit().then(() => {
        console.info(`Successfully accepted users in class ${lessonId}`);
    }).catch((err) => {
        console.error(`Error received: ${err}`);
    });
});