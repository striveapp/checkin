import * as admin from "firebase-admin";
import data from "./data/lesson_template";
import {LessonTemplate} from "../../types/lesson_template";

export const importLessonTemplate = async () => {
    const db = admin.firestore();
    const batch = db.batch();

    data.lesson_templates.forEach((lessonTemplate: LessonTemplate) => {
        const documentRef = db.collection("lesson_templates").doc();
        batch.set(documentRef, lessonTemplate);
    });

    return await batch.commit();
};

const generateLessonForDay = (day: Date) => {
    const db = admin.firestore();
    const batch = db.batch();
    const weekDay = day.toLocaleString('en-us', {weekday: 'long'}).toLowerCase();

    return db.collection("lesson_templates").where("weekDay", "==", weekDay).get().then((res) => {
        res.forEach((lessonTemplate) => {
            let dateISO = day.toISOString().split('T')[0];
            const lessonInstance = {
                ...lessonTemplate.data(),
                lessonTemplateRef: lessonTemplate.ref,
                date: dateISO
            };
            const documentRef = db.collection("lesson_instances")
                .doc(dateISO)
                .collection("instances").doc(lessonTemplate.id);
            batch.set(documentRef, lessonInstance, {merge: true})
        });
        return batch.commit();
    });
}

// NOTE: this should not run on Mondays, it may cause very weird issues that you would like to debug, trust me.
// https://stackoverflow.com/questions/23593052/format-javascript-date-as-yyyy-mm-dd/60012660#comment52948402_29774197
export const generateNextWeekOfLessonInstances = async () => {
    const nextWeekMonday = getNextWeekMonday();
    console.log("Next Monday: ", nextWeekMonday);

    try {
        //This will loop over the week and generate all the lesson instances
        for (let i = 0; i < 7; i++) {
            await generateLessonForDay(nextWeekMonday);
            nextWeekMonday.setDate(nextWeekMonday.getDate() + 1);
        }
    } catch (e) {
        return Promise.reject(e);
    }

    return Promise.resolve();
};

const getNextWeekDay = () => {
    const d = new Date();
    d.setDate(d.getDate() + 7);
    return d;
};

const getNextWeekMonday = () => {
    const nextWeekDay = getNextWeekDay();
    nextWeekDay.setUTCHours(0);
    const day = nextWeekDay.getDay();

    nextWeekDay.setDate(nextWeekDay.getDate() + (day == 0 ? -6 : 1) - day);
    return nextWeekDay;
};

export const generateNext2WeekOfLessonInstances = async () => {
    await generateNextWeekOfLessonInstances();

    const next2WeekMonday = getNext2WeekMonday();
    console.log("Next in 2 weeks Monday: ", next2WeekMonday);

    try {
        //This will loop over the week and generate all the lesson instances
        for (let i = 0; i < 7; i++) {
            await generateLessonForDay(next2WeekMonday);
            next2WeekMonday.setDate(next2WeekMonday.getDate() + 1);
        }
    } catch (e) {
        return Promise.reject(e);
    }

    return Promise.resolve();
};

const getNext2WeekDay = () => {
    const d = new Date();
    d.setDate(d.getDate() + 14);
    return d;
};

const getNext2WeekMonday = () => {
    const next2WeekDay = getNext2WeekDay();
    next2WeekDay.setUTCHours(0);
    const day = next2WeekDay.getDay();

    next2WeekDay.setDate(next2WeekDay.getDate() + (day == 0 ? -6 : 1) - day);
    return next2WeekDay;
};