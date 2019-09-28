import * as admin from "firebase-admin";
import * as functions from 'firebase-functions';

export const classCounterIncrementNotification = functions.firestore.document("users/{userEmail}").onUpdate((change, context) => {
    const docBefore = change.before.data() || {};
    const docAfter = change.after.data() || {};
    console.info("write context ", context);
    console.info("write change before ", docBefore);
    console.info("write change after", docAfter);


    if (docBefore.counter < docAfter.counter) {
        console.info("User counter increased, sending notification");
        const userEmail = context.params.userEmail;

        return admin.firestore().collection(`/users/${userEmail}/tokens`).listDocuments().then(tokens => {
            const notificationContent = {
                notification: {
                    title: "Class confirmed!",
                    body: `You attended ${docAfter.counter} classes`,
                    // icon: "default"
                }
            };

            return Promise.all(tokens.map(async tokenReference => {
                const tokenDocument = await tokenReference.get();
                const token = tokenDocument.data() || {};
                console.info(`processing token ${token.token}`);

                return admin.messaging().sendToDevice(token.token, notificationContent).then(() => {
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
    const today = current.toLocaleDateString('en-US',{weekday: 'long'});

    return admin.firestore().collection(`/lessons`).where('weekDay', '==', today).get().then(snapshot => {
        snapshot.forEach(doc => {
            console.log(doc.id, '=>', doc.data());
        });
    });

}