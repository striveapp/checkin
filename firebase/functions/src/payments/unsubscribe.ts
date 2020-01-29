import * as admin from "firebase-admin";
import {CallableContext} from "firebase-functions/lib/providers/https";
import * as functions from "firebase-functions";
import * as StripeApi from "stripe";
const stripe = new StripeApi(functions.config().stripe.secret_key);
const db = admin.firestore();

export const unsubscribe = functions.https.onCall(async (_, context: CallableContext) => {
    // verify Firebase Auth ID token
    if (!context.auth) {
        return { message: 'Authentication Required!', code: 401 };
    }

    const userEmail = (await admin.auth().getUser(context.auth.uid)).email || "unknown@user.com";

    console.log(`Attempting to cancel user [${userEmail}] subscription`);

    const customer = (await db.collection("customers")
        .doc(userEmail)
        .get()).data() || {};

    const subscriptionId = customer["subscription"]["id"];

    return await stripe.subscriptions.del(
        subscriptionId,
        function(err: StripeApi.IStripeError, confirmation: StripeApi.subscriptions.ISubscription) {
            // asynchronously called
            if( err ) {
                console.error(`Something went wrong canceling [${subscriptionId}] for user [${userEmail}]`, err.message);
                throw err;
            }
            console.log(`Subscription [${confirmation.id}] cancel confirmed for user [${userEmail}]`);
            return {code: "ok"};
        }
    );
});