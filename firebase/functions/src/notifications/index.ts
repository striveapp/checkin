import * as admin from "firebase-admin";
import * as functions from 'firebase-functions';

export const classCounterIncrementNotification = functions.firestore.document("users/{userEmail}").onUpdate((change, context) => {
    const docBefore = change.before.data() || {};
    const docAfter = change.after.data() || {};

    if (docBefore.counter < docAfter.counter) {
        console.info("User counter increased, sending notification");
        const userEmail = context.params.userEmail;

        return admin.firestore().collection(`/users/${userEmail}/tokens`).listDocuments().then(tokens => {
            //TODO: how can we internationalize this?
            const notificationContent = {
                data: {
                    type: "class_attended",
                    timestamp: `${Date.now()}`
                },
                notification: {
                    title: "Class confirmed!",
                    body: `You attended ${docAfter.counter} classes`,
                    clickAction: "FLUTTER_NOTIFICATION_CLICK",
                }
            };

            return Promise.all(tokens.map(async tokenReference => {
                const tokenDocument = await tokenReference.get();
                const token = tokenDocument.data() || {};

                return admin.messaging().sendToDevice(token.token, notificationContent, {contentAvailable: true}).then(() => {
                    console.info(`Notification sent to ${token.token}!`);
                })
            }));
        });
    }

    console.info("User counter did not increase");
    return Promise.resolve();
});

export const reminderOfNonAcceptedUsersForMaster = async () => {
    const current = new Date();
    //TODO: we should find a way to pass the timeZone dynamically
    const today = current.toLocaleString("en-US", {timeZone: "Europe/Madrid", weekday: "long"})

    return admin.firestore().collection(`/lessons`).where('weekDay', '==', today).get().then(snapshot => {
        snapshot.forEach(doc => {
            const {
                attendees = [],
                masters = [],
            } = doc.data();

            if (attendees.length > 0) {
                console.info(`Found class (${doc.id}) with attendees`);
                console.info("Needs to notify master, sending notification");
                masters.forEach(async ({name, email: masterEmail}: any) => {
                    console.info(`Send notification to: ${name}`);
                    await admin.firestore().collection(`/users/${masterEmail}/tokens`).listDocuments().then(tokens => {
                        //TODO: how can we internationalize this?
                        const notificationContent = {
                            data: {
                                type: "master_reminder",
                                lessonId: doc.id,
                                timestamp: `${Date.now()}`
                            },
                            notification: {
                                title: "Action Required!",
                                body: "You still have students in class",
                                clickAction: "FLUTTER_NOTIFICATION_CLICK",
                            }
                        };

                        return Promise.all(tokens.map(async tokenReference => {
                            const tokenDocument = await tokenReference.get();
                            const token = tokenDocument.data() || {};

                            return admin.messaging().sendToDevice(token.token, notificationContent, { contentAvailable: true }).then(() => {
                                console.info(`Notification sent to ${token.token}!`);
                            })
                        }));
                    });
                });
            }
        });
    });
}