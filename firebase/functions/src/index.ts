import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions';
import * as express from 'express';
import {generateBackup, restoreBackup} from './backups/index';
import { validateFirebaseIdToken } from "./middlewares/validations";

admin.initializeApp()

const app = express();
app.use(validateFirebaseIdToken);
app.get('/restoreBackup', async (req, res) => {
    try {
        await restoreBackup();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the backup restore: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

/**
 * Automated Backups
 */
export const automatedBackups = functions.pubsub
    .schedule('0 3 * * *')
    .onRun(generateBackup);

export const restoreYesterdayBackup = functions.https.onRequest(app);