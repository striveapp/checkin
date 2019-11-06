import * as admin from "firebase-admin";
import {CallableContext} from "firebase-functions/lib/providers/https";
import * as functions from "firebase-functions";
import {AcceptAllPayload, Attendee, Lesson,} from "../types/lessons";
import {GlobalHistory, HistoryAttendee, HistoryAttendeesMap, UserHistory} from "../types/history";

const db = admin.firestore();

const getMondayOfCurrentWeek = () => {
    const date = new Date();
    date.setUTCHours(0);

    const day = date.getDay();
    return new Date(date.getFullYear(), date.getMonth(), date.getDate() + (day == 0?-6:1)-day ).getTime();
};

const generateHistoryAttendee = ({email, name, imageUrl, rank}: Attendee): HistoryAttendee => ({
    email,
    name,
    imageUrl,
    rank,
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

const incrementUserCounter = () => ({
    "counter": admin.firestore.FieldValue.increment(1)
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

export const acceptAll = functions.https.onCall(({lesson}: AcceptAllPayload, context: CallableContext) => {
    const {
        id: lessonId,
        attendees,
    } = lesson;

    console.log(`Accepting [${attendees.length}] attendees for lesson with id [${lessonId}]`);
    console.log("Attendees:", attendees.map(attendee => attendee.email));
    // setup batch
    const batch = db.batch();

    const historyAttendees: { [key: string]: HistoryAttendee; } = {};

    attendees.forEach((attendee) => {
        let email = attendee.email;
        historyAttendees[email] = generateHistoryAttendee(attendee);

        const userHistoryRef = db.collection("users_history").doc(email);
        batch.set(userHistoryRef, generateUserHistory(lesson), {merge: true});

        const userRef = db.collection("users").doc(email);
        batch.update(userRef, incrementUserCounter());
    });

    // update globalHistory
    const globalHistoryRef = db.collection("global_history").doc(lessonId);
    batch.set(globalHistoryRef, generateGlobalHistory(lesson, historyAttendees), {merge: true});

    // remove users from lessons
    const lessonRef = db.collection("lessons").doc(lessonId);
    batch.update(lessonRef, {
        "attendees": admin.firestore.FieldValue.delete()
    });

    return batch.commit().then(() => {
        console.info(`Successfully accepted users in class ${lessonId}`);
    }).catch((err) => {
        console.error(`Error received: ${err}`);
    });
});