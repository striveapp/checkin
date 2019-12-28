import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions';
import {generateBackup} from './backups';
import {classCounterIncrementNotification, reminderOfNonAcceptedUsersForMaster} from "./notifications";
import adminApp from "./admin";

admin.initializeApp();

// PubSub triggers
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

// https onCall triggers
export * from "./api/lessons";

// https onRequest triggers
export * from "./payments/webhook";

// firestore triggers
export const userNotification = classCounterIncrementNotification;
