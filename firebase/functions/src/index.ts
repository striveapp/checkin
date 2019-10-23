import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions';


import {generateBackup} from './backups';
import {classCounterIncrementNotification, reminderOfNonAcceptedUsersForMaster} from "./notifications";
import adminApp from "./admin";

admin.initializeApp();

// pubsub triggers
export const automatedBackups = functions.pubsub
    .schedule('0 3 * * *')
    .timeZone('Europe/Madrid')
    .onRun(generateBackup);

export const masterNotification = functions.pubsub
    .schedule('0 23 * * 1-6')
    .timeZone('Europe/Madrid')
    .onRun(reminderOfNonAcceptedUsersForMaster);


// http triggers
export const app = functions.https.onRequest(adminApp);

export const register = functions.https.onCall(async ({ lessonId, attendee }, context) => {
    /**
     * Should receive:
     * @param {string} lessonId The id of the lesson.
     * @param {object} attendee of the lesson
     * "attendee":{"imageUrl":"img","name":"davide bubz","rank":"Purple","email":"mail"},"lessonId":"lujpKlxJnfOMZ3Q0OAGl"}
     * */

    const path = "lessons";
    console.info(`User ${attendee.name} is attempting to register to lesson: ${lessonId}`);
    return admin.firestore().collection(path).doc(lessonId).update({
        'attendees': admin.firestore.FieldValue.arrayUnion(
          {
              'name': attendee.name,
              'imageUrl': attendee.imageUrl,
              'grade': attendee.rank,
              'email': attendee.email
          }
        )
    }).then(() => {
        console.info(`Successfully register user: ${attendee.name} in class ${lessonId}`);
    }).catch((err) => {
        console.error(`Error received: ${err}`);
    });
});


// firestore triggers
export const userNotification = classCounterIncrementNotification;