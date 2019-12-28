import * as functions from "firebase-functions";
import * as StripeApi from "stripe";
import * as admin from "firebase-admin";

// Set your secret key: remember to change this to your live secret key in production
// See your keys here: https://dashboard.stripe.com/account/apikeys
//TODO: this should become parametric
const stripe = new StripeApi('sk_test_ffufTz0ylkruTgFFMS0mgpgR00A18tXLpF');

const db = admin.firestore();

// Find your endpoint's secret in your Dashboard's webhook settings
// todo this should become parametric??
const endpointSecret = 'whsec_udbaiePfQWOvNsh9RsqBUMwZs2tG4d4z';

export const webhook = functions.https.onRequest(async (request, response) => {
    console.log("Received webhook event: ", JSON.stringify(request.body));

    const sig = request.headers['stripe-signature'];
    let event;

    if(!sig) {
        return response.status(400).send(`Webhook Error: stripe-signature is required`);
    }

    try {
        event = stripe.webhooks.constructEvent(request.rawBody, sig, endpointSecret);
    } catch (err) {
        return response.status(400).send(`Webhook Error: ${err.message}`);
    }

    // Handle the checkout.session.completed event
    if (event.type === 'checkout.session.completed') {
        const session: any = event.data.object;

        console.log("received complete event ", JSON.stringify(session));
        // Fulfill the purchase...
        let email = session["customer_email"] || "unknownUser";

        await db.collection("subscriptions").doc(email)
            .collection("payments")
            .add(session);
        // todo update user information with batch update to show in profile
        // todo prevent all users from reading subscriptions collection
    }


    // Return a response to acknowledge receipt of the event
    return response.json({received: true});
});

