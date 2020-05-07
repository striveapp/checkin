import * as admin from "firebase-admin";
import lessonTemplates from "./data/lesson_template";
import subscriptionPlansData from "./data/subscription_plans";
import {LessonTemplate} from "../../types/lesson_template";
import {SubscriptionPlan} from "../../types/subscription_plan";

export const importLessonTemplate = async (gymId: string) => {
    const db = admin.firestore();
    const batch = db.batch();

    lessonTemplates[gymId].lesson_templates.forEach(( lessonTemplate: LessonTemplate) => {
        const documentRef = db.collection("gyms").doc(gymId).collection("lesson_template").doc();
        batch.set(documentRef, lessonTemplate);
    });

    return await batch.commit();
};

export const importSubscriptionPlans = async (gymId: string) => {
    const db = admin.firestore();
    const batch = db.batch();

    subscriptionPlansData[gymId].subscription_plans.forEach((subscriptionPlan: SubscriptionPlan) => {
        const documentRef = db.collection("gyms").doc(gymId).collection("subscription_plans").doc();
        batch.set(documentRef, subscriptionPlan);
    });

    return await batch.commit();
};

const generateLessonForDay = (day: Date, gymId: string) => {
    const db = admin.firestore();
    const batch = db.batch();
    const weekDay = day.toLocaleString('en-us', {weekday: 'long'}).toLowerCase();
    return db.collection("gyms").doc(gymId).collection("lesson_template").where("weekDay", "==", weekDay).get().then((res) => {
        res.forEach((lessonTemplate) => {
            const dateISO = day.toISOString().split('T')[0];
            const lessonInstance = {
                ...lessonTemplate.data(),
                lessonTemplateRef: lessonTemplate.ref,
                date: dateISO
            };
            const documentRef = db.collection("gyms").doc(gymId).collection("lesson_instances")
                .doc(dateISO)
                .collection("instances").doc(lessonTemplate.id);
            batch.set(documentRef, lessonInstance, {merge: true})
        });
        return batch.commit();
    });
}

// NOTE: this should not run on Mondays, it may cause very weird issues that you would like to debug, trust me.
// https://stackoverflow.com/questions/23593052/format-javascript-date-as-yyyy-mm-dd/60012660#comment52948402_29774197
export const generateNextWeekOfLessonInstances = async (gymId: string) => {
    const nextWeekMonday = getNextWeekMonday();
    console.log("Next Monday: ", nextWeekMonday);

    try {
        //This will loop over the week and generate all the lesson instances
        for (let i = 0; i < 7; i++) {
            await generateLessonForDay(nextWeekMonday, gymId);
            nextWeekMonday.setDate(nextWeekMonday.getDate() + 1);
        }
    } catch (e) {
        return Promise.reject(e);
    }

    return Promise.resolve();
};

const getNextWeekDay = () => {
    const d = new Date();
    d.setDate(d.getDate() + 7);
    return d;
};

const getNextWeekMonday = () => {
    const nextWeekDay = getNextWeekDay();
    nextWeekDay.setUTCHours(0);
    const day = nextWeekDay.getDay();

    nextWeekDay.setDate(nextWeekDay.getDate() + (day == 0 ? -6 : 1) - day);
    return nextWeekDay;
};

export const generateNext2WeekOfLessonInstances = async (gymId: string) => {
    await generateNextWeekOfLessonInstances(gymId);

    const next2WeekMonday = getNext2WeekMonday();
    console.log("Next in 2 weeks Monday: ", next2WeekMonday);

    try {
        //This will loop over the week and generate all the lesson instances
        for (let i = 0; i < 7; i++) {
            await generateLessonForDay(next2WeekMonday, gymId);
            next2WeekMonday.setDate(next2WeekMonday.getDate() + 1);
        }
    } catch (e) {
        return Promise.reject(e);
    }

    return Promise.resolve();
};

export const generateThisWeekOfLessonInstances = async (gymId: string) => {
    const thisWeekMonday = getThisWeekMonday();
    console.log("This week Monday: ", thisWeekMonday);

    try {
        //This will loop over the week and generate all the lesson instances
        for (let i = 0; i < 7; i++) {
            await generateLessonForDay(thisWeekMonday, gymId);
            thisWeekMonday.setDate(thisWeekMonday.getDate() + 1);
        }
    } catch (e) {
        return Promise.reject(e);
    }

    return Promise.resolve();
};

const getNext2WeekDay = () => {
    const d = new Date();
    d.setDate(d.getDate() + 14);
    return d;
};

const getNext2WeekMonday = () => {
    const next2WeekDay = getNext2WeekDay();
    next2WeekDay.setUTCHours(0);
    const day = next2WeekDay.getDay();

    next2WeekDay.setDate(next2WeekDay.getDate() + (day == 0 ? -6 : 1) - day);
    return next2WeekDay;
};


const getThisWeekMonday = () => {
    const thisWeekDay = new Date();
    thisWeekDay.setUTCHours(0);
    const day = thisWeekDay.getDay();

    thisWeekDay.setDate(thisWeekDay.getDate() + (day == 0 ? -6 : 1) - day);
    return thisWeekDay;
};

export const createNewGym = async (gymId: string) => {
    //2. import the lesson_template
    console.info("import lesson_template for", gymId)
    await importLessonTemplate( gymId );
    //3. import the subscription_plans
    console.info("import subscription_plans for", gymId)
    await importSubscriptionPlans( gymId );
    //4. generate this week of lesson_instances
    console.info("generate this week lesson_instances for", gymId)
    await generateThisWeekOfLessonInstances( gymId );
    //5. generate next 2 week of lesson_instances
    console.info("generate next 2 weeks lesson_instances for", gymId)
    await generateNext2WeekOfLessonInstances( gymId );
}
