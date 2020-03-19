import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions';
import {generateBackup} from './backups';
import {
    classCounterIncrementNotification,
    firstUserRegisterToClassNotification,
    reminderOfNonAcceptedUsersForMaster
} from "./notifications";
import adminApp from "./admin";
import {generateNext2WeekOfLessonInstances} from "./admin/imports";

admin.initializeApp();

// PubSub triggers
export const automatedBackups = functions.pubsub
    //At 03:00.
    .schedule('0 3 * * *')
    .timeZone('Europe/Madrid')
    .onRun(generateBackup);

export const masterReminderNotification = functions.pubsub
    //At 23:00 on every day-of-week from Monday through Saturday.
    .schedule('0 23 * * 1-6')
    .timeZone('Europe/Madrid')
    .onRun(reminderOfNonAcceptedUsersForMaster);

export const generateNext2WeekOfLessons = functions.pubsub
    //At 02:00 on Friday.
    .schedule('0 2 * * 5')
    .timeZone('Europe/Madrid')
    .onRun(generateNext2WeekOfLessonInstances);

// http triggers
export const app = functions.https.onRequest(adminApp);

// https onCall triggers
export * from "./api/lessons";
export * from "./payments/unsubscribe";

// https onRequest triggers
export * from "./payments/webhook";

// firestore triggers
export const userNotification = classCounterIncrementNotification;
export const masterNotification = firstUserRegisterToClassNotification;
