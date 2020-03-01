import * as admin from "firebase-admin";
import data from "./data/lesson_template";
import {LessonTemplate} from "../types/lesson_template";

export const importLessonTemplate = async () => {
    const db = admin.firestore();
    const batch = db.batch();

    data.lesson_templates.forEach((lesson_template: LessonTemplate) => {
        const documentRef = db.collection("lesson_template").doc();
        batch.set(documentRef, lesson_template);
    });

    return await batch.commit();
};