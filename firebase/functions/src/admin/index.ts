import * as express from 'express';
import {validateFirebaseIdToken} from "./middlewares/validations";
import {restoreBackup, generateBackup} from "../backups";
import {reminderOfNonAcceptedUsersForMaster} from "../notifications";
import {
    generateNextWeekOfLessonInstances,
    generateNext2WeekOfLessonInstances,
    generateThisWeekOfLessonInstances,
    importLessonTemplate,
    importSubscriptionPlans,
    createNewGym
} from "./imports";
import {migrateToMultiGym} from "./migrations";

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

adminApp.get('/:gymId/notifyMaster', async (req, res) => {
    try {
        const gymId: string = req.params.gymId;
        await reminderOfNonAcceptedUsersForMaster(gymId);
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the notification: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/:gymId/importLessonTemplate', async (req, res) => {
    try {
        const gymId: string = req.params.gymId;
        await importLessonTemplate( gymId );
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the import of lesson template: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/:gymId/importSubscriptionPlans', async (req, res) => {
    try {
        const gymId: string = req.params.gymId;
        await importSubscriptionPlans(gymId);
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the import of lesson template: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/:gymId/generateNextWeekOfLessonInstances', async (req, res) => {
    try {
        const gymId: string = req.params.gymId;
        await generateNextWeekOfLessonInstances(gymId);
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the seed of lesson instances: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/:gymId/generateNext2WeekOfLessonInstances', async (req, res) => {
    try {
        const gymId: string = req.params.gymId;
        await generateNext2WeekOfLessonInstances(gymId);
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the seed of lesson instances: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/:gymId/generateThisWeekOfLessonInstances', async (req, res) => {
    try {
        const gymId: string = req.params.gymId;
        await generateThisWeekOfLessonInstances(gymId);
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the seed of lesson instances: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/:gymId/createNewGym', async (req, res) => {
    try {
        const gymId: string = req.params.gymId;
        await createNewGym(gymId);
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the seed of lesson instances: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

adminApp.get('/migrateToMultiGym', async (req, res) => {
    try {
        await migrateToMultiGym();
        res.status(200).send("Gotcha!");
    } catch (e) {
        console.error(`Something bad happen with the seed of lesson instances: ${e.message}`)
        res.status(400).send("Bad things");
    }
});

export default adminApp;
