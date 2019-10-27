import * as admin from "firebase-admin";
import { CallableContext } from "firebase-functions/lib/providers/https";
import * as functions from "firebase-functions";
import { ClearPayload, RegisterPayload, UnregisterPayload } from "../types/lessons";

const path = "lessons";

export const register = functions.https.onCall(({ lessonId, attendee }: RegisterPayload, context: CallableContext) =>
  admin.firestore().collection(path).doc(lessonId).update({
    "attendees": admin.firestore.FieldValue.arrayUnion(
      {
        "name": attendee.name,
        "imageUrl": attendee.imageUrl,
        "grade": attendee.rank,
        "email": attendee.email
      }
    )
  }).then(() => {
    console.info(`Successfully register user: ${attendee.name} in class ${lessonId}`);
  }).catch((err) => {
    console.error(`Error received: ${err}`);
  }));

export const unregister = functions.https.onCall( ({ lessonId, attendee }: UnregisterPayload, context: CallableContext) =>
  admin.firestore().collection(path).doc(lessonId).update({
    "attendees": admin.firestore.FieldValue.arrayRemove(
      {
        "name": attendee.name,
        "imageUrl": attendee.imageUrl,
        "grade": attendee.rank,
        "email": attendee.email
      }
    )
  }).then(() => {
    console.info(`Successfully unregister user: [${attendee.name}] in class [${lessonId}]`);
  }).catch((err) => {
    console.error(`Error received: ${err}`);
  }));


export const clear = functions.https.onCall( ({ lessonId }: ClearPayload, context: CallableContext) =>
  admin.firestore().collection(path).doc(lessonId).update({
    "attendees": admin.firestore.FieldValue.delete()
  }).then(() => {
    console.info(`Successfully cleared lesson [${lessonId}]`);
  }).catch((err) => {
    console.error(`Error received: ${err}`);
  }));