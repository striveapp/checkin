import * as express from 'express';
import {validateFirebaseIdToken} from "./middlewares/validations";
import {restoreBackup, generateBackup} from "../backups";
import {reminderOfNonAcceptedUsersForMaster} from "../notifications";
import {generateNextWeekOfLessonInstances, generateNext2WeekOfLessonInstances, importLessonTemplate} from "./imports";

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

adminApp.get('/generateBackup', async (req, res) => {
    try {
        await generateBackup();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the generate backup: ${e.message}`)
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

adminApp.get('/importLessonTemplate', async (req, res) => {
    try {
        await importLessonTemplate();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the import of lesson template: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/generateNextWeekOfLessonInstances', async (req, res) => {
    try {
        await generateNextWeekOfLessonInstances();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the seed of lesson instances: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/generateNext2WeekOfLessonInstances', async (req, res) => {
    try {
        await generateNext2WeekOfLessonInstances();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the seed of lesson instances: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

export default adminApp;