import { Request, Response, NextFunction } from 'express';
import * as admin from "firebase-admin";

// Express middleware that validates Firebase ID Tokens passed in the Authorization HTTP header.
// The Firebase ID token needs to be passed as a Bearer token in the Authorization HTTP header like this:
// `Authorization: Bearer <Firebase ID Token>`.
function notAuthenticated(error: string, res: Response) {
    console.error('Error while verifying Firebase ID token:', error);
    res.status(403).send('Unauthorized');
}

export const validateFirebaseIdToken = async (req: Request, res: Response, next: NextFunction ) => {
    console.log('Check if request is authorized with Firebase ID token');

    if ((!req.headers.authorization || !req.headers.authorization.startsWith('Bearer ')) &&
        !(req.cookies && req.cookies.__session)) {
        console.error('No Firebase ID token was passed as a Bearer token in the Authorization header.',
            'Make sure you authorize your request by providing the following HTTP header:',
            'Authorization: Bearer <Firebase ID Token>',
            'or by passing a "__session" cookie.');
        res.status(403).send('Unauthorized');
        return;
    }

    let idToken;
    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer ')) {
        console.log('Found "Authorization" header');
        // Read the ID Token from the Authorization header.
        idToken = req.headers.authorization.split('Bearer ')[1];
    } else {
        // No cookie
        res.status(403).send('Unauthorized');
        return;
    }

    try {
        const decodedIdToken = await admin.auth().verifyIdToken(idToken);
        console.log('ID Token correctly decoded', decodedIdToken);
        //TACCONAZZO
        if (decodedIdToken.email === 'kidomaru.93@gmail.com' || decodedIdToken.email === 'stefano.saitta92@gmail.com' ) {
            next();
            return;
        }
        notAuthenticated(`User: ${decodedIdToken.email} is not admin`, res);
        return;
    } catch (error) {
        notAuthenticated(error, res);
        return;
    }
};