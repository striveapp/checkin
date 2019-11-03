import * as admin from "firebase-admin";
import { CallableContext } from "firebase-functions/lib/providers/https";
import * as functions from "firebase-functions";
import { AcceptAllPayload, } from "../types/lessons";

const db = admin.firestore();

export const acceptAll = functions.https.onCall(({ lessonId, attendees }: AcceptAllPayload, context: CallableContext) => {
  const batch = db.batch()
  const lessonRef = db.collection("lessons").doc(lessonId);

  attendees.forEach(({ email }) => {
    const userRef = db.collection("users").doc(email);
    batch.update(userRef, {
      "counter": admin.firestore.FieldValue.increment(1)
    });
  });

  batch.update(lessonRef, {
    "attendees": admin.firestore.FieldValue.delete()
  });

  return batch.commit().then(() => {
    console.info(`Successfully accepted users in class ${lessonId}`);
  }).catch((err) => {
    console.error(`Error received: ${err}`);
  });

});