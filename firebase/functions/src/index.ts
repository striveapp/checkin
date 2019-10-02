import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions';
import * as express from 'express';
import {generateBackup, restoreBackup} from './backups';
import {validateFirebaseIdToken} from "./middlewares/validations";
import { classCounterIncrementNotification, reminderOfNonAcceptedUsersForMaster }  from "./notifications";

admin.initializeApp()

const expressApp = express();
expressApp.use(validateFirebaseIdToken);
expressApp.get('/restoreBackup', async (req, res) => {
    try {
        await restoreBackup();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the backup restore: ${e.message}`)
        res.status(400).send("Bad things");
    }
});
expressApp.get('/notifyMaster', async (req, res) => {
    try {
        await reminderOfNonAcceptedUsersForMaster();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the notification: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

export const automatedBackups = functions.pubsub
    .schedule('0 3 * * *')
    .timeZone('Europe/Madrid')
    .onRun(generateBackup);

export const app = functions.https.onRequest(expressApp);

export const userNotification = classCounterIncrementNotification;

export const masterNotification = functions.pubsub
  .schedule('0 23 * * 1-6')
  .timeZone('Europe/Madrid')
  .onRun(reminderOfNonAcceptedUsersForMaster);