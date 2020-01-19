import * as admin from "firebase-admin";
import * as functions from "firebase-functions-test";
import {AcceptAllPayload, Attendee} from "../types/lessons";

describe('Yeah', () => {
    const testEnv = functions();
    let adminStub: jest.SpyInstance;
    let api: any;

    beforeAll(() => {
        // you can use `sinon.stub` instead
        adminStub = jest.spyOn(admin, "initializeApp");

        // after initializeApp call, we load our functions
        api = require("../index");
    });

    afterAll(() => {
        // clean things up
        adminStub.mockRestore();
        testEnv.cleanup();
    });

    it('should do shit', async () => {
        console.log(api);
        const wrapped = testEnv.wrap(api.acceptAll);

        const testAttendee: Attendee = {
            name: "test",
            imageUrl: "not.really.com/img.png",
            rank: "White",
            email: "test@test.com",
        };
        const params: AcceptAllPayload = {
            lesson: {
                id: "id",
                name: "BJJ",
                timeStart: "10:30",
                timeEnd: "11:30",
                weekDay: "Monday",
                masters: [],
                attendees: [
                    testAttendee
                ]
            }
        };

        await wrapped(params);

        // we read our user from database
        const userHistoryForTestUser = await admin
            .database()
            .ref(`/users_history/${testAttendee.email}`)
            .once("value")

        // we expect our newly created user to have zero points
        expect(userHistoryForTestUser.val()).toHaveProperty("attendedLessons");
    });
});
