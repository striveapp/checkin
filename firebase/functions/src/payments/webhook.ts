import * as functions from "firebase-functions";
import * as StripeApi from "stripe";
import * as admin from "firebase-admin";

// See your keys here: https://dashboard.stripe.com/account/apikeys
const stripe = new StripeApi(functions.config().stripe.secret_key);
const db = admin.firestore();

/**
 * Webhook possible events to be handled:
 *
 *  - customer.subscription.updated: Occurs whenever a subscription changes (e.g., switching from one plan to another, or changing the status from trial to active).
 *  - customer.updated: Occurs whenever any property of a customer changes.
 *  - checkout.session.completed: Occurs when a Checkout Session has been successfully completed.
 *  - payment_method.attached: Occurs whenever a new payment method is attached to a customer.
 * */


/**
 * Event: checkout.session.completed
 * */
function checkoutCompleted(event: any) {
    const session: any = event.data.object;

    console.log("received complete event ", JSON.stringify(session));
    // Fulfill the purchase...
    const email = session["customer_email"] || "unknownUser";

    return db.collection("customers")
        .doc(email)
        .collection("payments")
        .doc()
        .create(session);
}

/**
 * Event: customer.subscription.updated
 * */
function subscriptionUpdated(event: any) {
    const subscription: any = event.data.object;

    console.log("received subscription updated event ", JSON.stringify(subscription));

    const customer = subscription["customer"];
    return db.collection("customers")
        .where("stripeIds", "array-contains", customer)
        .get()
        .then(snapshot => {
            if (snapshot.empty) {
                console.log('No matching customers with stripeId ', customer);
                throw new Error('No matching customers with stripeId ' + customer);
            }

            snapshot.forEach(doc => {
                console.log("updating subscription for", doc.id);
                return doc.ref.set({subscription: subscription}, {merge: true});
            });
        });
}

/**
 * Event: customer.updated
 * Subscription states:
 *  - trialing
 *  - active
 *  - incomplete
 *  - incomplete_expired
 *  - past_due
 *  - canceled
 *  - unpaid
 * */
function customerUpdated(event: any) {
    const customer: any = event.data.object;

    console.log("received customer updated ", JSON.stringify(customer));

    const id = customer["id"];
    const email = customer["email"];


    return db.collection("customers")
        .doc(email)
        .set({infos: customer, stripeIds: admin.firestore.FieldValue.arrayUnion(id)}, {merge: true});
}

/**
 * Event: payment_method.attached
 * */
function paymentMethodAttached(event: any) {
    const paymentMethod: any = event.data.object;

    console.log("received paymentMethod attached ", JSON.stringify(paymentMethod));

    const email = paymentMethod["billing_details"]["email"];

    return db.collection("customers")
        .doc(email)
        .set({payment_method: paymentMethod}, {merge: true});
}

export const webhook = functions.https.onRequest(async (request, response) => {
    console.log("Received webhook event: ", JSON.stringify(request.body));

    const sig = request.headers['stripe-signature'];

    if (!sig) {
        return response.status(400).send(`Webhook Error: stripe-signature is required`);
    }

    let event;

    try {
        event = stripe.webhooks.constructEvent(request.rawBody, sig, functions.config().stripe.web_hook_key);

        // todo update user information with batch update to show in profile
        // todo prevent all users from reading subscriptions collection
        switch (event.type) {
            case 'checkout.session.completed':
                await checkoutCompleted(event);
                break;
            case 'customer.subscription.updated':
                await subscriptionUpdated(event);
                break;
            case 'customer.updated':
                await customerUpdated(event);
                break;
            case 'payment_method.attached':
                await paymentMethodAttached(event);
                break;
            default:
                return response.status(400).send(`Unknown Webhook Event`);
        }
    } catch (err) {
        return response.status(400).send(`Webhook Error: ${err.message}`);
    }

    // Return a response to acknowledge receipt of the event
    return response.json({received: true});
});

