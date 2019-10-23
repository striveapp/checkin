import * as express from 'express';
import {validateFirebaseIdToken} from "../middlewares/validations";
import {restoreBackup} from "../backups";
import {reminderOfNonAcceptedUsersForMaster} from "../notifications";

const adminApp = express();

adminApp.use(validateFirebaseIdToken);

adminApp.get('/restoreBackup', async (req, res) => {
    try {
        await restoreBackup();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the backup restore: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/notifyMaster', async (req, res) => {
    try {
        await reminderOfNonAcceptedUsersForMaster();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the notification: ${e.message}`)
        res.status(400).send("Bad things");
    }
});


export default adminApp;