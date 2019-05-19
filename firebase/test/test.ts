/// <reference path='../node_modules/mocha-typescript/globals.d.ts' />
import * as firebase from "@firebase/testing";
import * as fs from "fs";
import doc = Mocha.reporters.doc;

/*
 * ============
 *    Setup
 * ============
 */
const projectId = "firestore-emulator-example";
const coverageUrl = `http://localhost:8080/emulator/v1/projects/${projectId}:ruleCoverage.html`;

const rules = fs.readFileSync("rules/firestore.rules", "utf8");

/**
 * Creates a new app with no authentication.
 *
 * @return {object} the app.
 */
function nonAuthedApp() {
    return firebase.initializeTestApp({projectId})
        .firestore();
}

/**
 * Creates a new app with authentication data matching the input.
 *
 * @param {object} auth the object to use for authentication (typically {uid: some-uid})
 * @return {object} the app.
 */
function authedApp(auth) {
    return firebase
        .initializeTestApp({projectId, auth})
        .firestore();
}

/**
 * Creates a new admin app.
 *
 * @return {object} the app.
 */
function adminApp() {
    return firebase
        .initializeAdminApp({projectId})
        .firestore();
}



/*
 * ============
 *  Test Cases
 * ============
 */
before(async () => {
    await firebase.loadFirestoreRules({projectId, rules});
});

beforeEach(async () => {
    // Clear the database between tests
    await firebase.clearFirestoreData({projectId});
});

after(async () => {
    await Promise.all(firebase.apps().map(app => app.delete()));
    console.log(`View rule coverage information at ${coverageUrl}\n`);
});

@suite
class MyApp {
    // test collection: users

    @test
    async "require users to log in before creating a profile"() {
        const db = authedApp(null);
        const profile = db.collection("users").doc("alice");
        await firebase.assertFails(profile.set({birthday: "January 1"}));
    }

    @test
    async "should only let users create or update their own profile"() {
        const db = authedApp({uid: "loggedUser", email: "loggedUser@test.com"});
        await firebase.assertSucceeds(
            db
                .collection("users")
                .doc("loggedUser@test.com")
                .set({
                    birthday: "January 1",
                    createdAt: firebase.firestore.FieldValue.serverTimestamp()
                })
        );

        await firebase.assertSucceeds(
            db
                .collection("users")
                .doc("loggedUser@test.com")
                .update({
                    updatedAt: firebase.firestore.FieldValue.serverTimestamp()
                })
        );

        await firebase.assertFails(
            db
                .collection("users")
                .doc("otherUser@test.com")
                .update({
                    birthday: "January 1",
                    createdAt: firebase.firestore.FieldValue.serverTimestamp()
                })
        );
    }


    @test
    async "should only let users read their own profile"() {
        const db = authedApp({uid: "loggedUser", email: "loggedUser@test.com"});
        await firebase.assertSucceeds(
            db
                .collection("users")
                .doc("loggedUser@test.com")
                .get()
        );
        await firebase.assertFails(
            db
                .collection("users")
                .doc("otherUser@test.com")
                .get()
        );
    }


    @test
    async "should block any user creating/upgrading himself as master or dev unless they already are"() {
        const db = authedApp({uid: "loggedUser", email: "loggedUser@test.com"});
        const admin = adminApp()
        await firebase.assertFails(
            db
                .collection("users")
                .doc("loggedUser@test.com")
                .set({
                    isOwner: true
                })
        );

        await firebase.assertFails(
            db
                .collection("users")
                .doc("loggedUser@test.com")
                .set({
                    isDev: true
                })
        );


        await firebase.assertSucceeds(
            admin
                .collection("users")
                .doc("loggedUser@test.com")
                .set({
                    isOwner: false,
                    isDev: false
                })
        );
        await firebase.assertFails(
            db
                .collection("users")
                .doc("loggedUser@test.com")
                .update({
                    isOwner: true
                })
        );

       await firebase.assertSucceeds(
            admin
                .collection("users")
                .doc("loggedUser@test.com")
                .set({
                    isOwner: true,
                    isDev: false
                })
        );
        await firebase.assertSucceeds(
            db
                .collection("users")
                .doc("loggedUser@test.com")
                .update({
                    isOwner: true
                })
        );

        await firebase.assertSucceeds(
            admin
                .collection("users")
                .doc("loggedUser@test.com")
                .set({
                    isOwner: false,
                    isDev: true
                })
        );
        await firebase.assertSucceeds(
            db
                .collection("users")
                .doc("loggedUser@test.com")
                .update({
                    isOwner: true
                })
        );

    }

    // test collection class

    @test
    async "should only let registered users read class collection"() {
        const loggedUser = authedApp({uid: "loggedUser", email: "loggedUser@test.com"});

        await firebase.assertSucceeds(
            loggedUser
                .collection("class")
                .get()
        );

        const nonLoggedUser = nonAuthedApp();

        await firebase.assertFails(
            nonLoggedUser
                .collection("class")
                .get()
        );
    }

    /**
     * we modify user.isOwner manually, therefore no-one should be able to set that property to true
     * */
    @test
    async "should only let guild master delete class members"() {
        const user = authedApp({uid: "loggedUser", email: "loggedUser@test.com", name: "user"});
        const master = authedApp({uid: "masterUser", email: "masterUser@test.com"});
        const admin = adminApp();

        // master user registers normally
        await firebase.assertSucceeds(
            master
                .collection("users")
                .doc("masterUser@test.com")
                .set({
                    name: "master",
                })
        );

        // an admin upgrades to master role
        await firebase.assertSucceeds(
            admin
                .collection("users")
                .doc("masterUser@test.com")
                .update({
                    isOwner: true,
                })
        );

        // an user registers normally
        await firebase.assertSucceeds(
            user
                .collection("users")
                .doc("loggedUser@test.com")
                .set({
                    name: "user",
                })
        );

        // the user registers to class
        await firebase.assertSucceeds(
            user
                .collection("class")
                .doc("randomId")
                .set({
                    name: "user"
                })
        );

        // user cannot remove himself from class
        await firebase.assertFails(
            user
                .collection("class")
                .doc("randomId")
                .delete()
        );

        // only masters can remove members from class
        await firebase.assertSucceeds(
            master
                .collection("class")
                .doc("randomId")
                .delete()
        );
    }

    @test
    async "user can only register himself to class"() {
        const user = authedApp({uid: "loggedUser", email: "loggedUser@test.com", name: "user"});

        // an user registers normally
        await firebase.assertSucceeds(
            user
                .collection("users")
                .doc("loggedUser@test.com")
                .set({
                    name: "user",
                })
        );

        // the user registers to class
        await firebase.assertSucceeds(
            user
                .collection("class")
                .doc("randomId")
                .set({
                    name: "user"
                })
        );

        // user cannot register somebody else to class
        await firebase.assertFails(
            user
                .collection("class")
                .doc("anotherRandomId")
                .set({
                    name: "anotherUser"
                })
        );

    }

    // todo: user cannot register multiple times, we get this for free if we use user email as id instead of a randomId
}
