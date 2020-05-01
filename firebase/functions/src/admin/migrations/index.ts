import * as admin from "firebase-admin";

async function dropCollection( collectionPath: string ) {
    const db = admin.firestore();

    const batch = db.batch();
    const collectionReference = db.collection( collectionPath );
    const documents = await collectionReference.listDocuments();
    for ( const document of documents ) {
        let subCollections = await document.listCollections();
        for ( const collection of subCollections ) {
            await dropCollection( collection.path );
        }
        await batch.delete( document );
    }

    await batch.commit();
}

async function migrate( collectionPath: string ) {
    const db = admin.firestore();

    const batch = db.batch();
    const collectionReference = db.collection( collectionPath );
    const oldPath = collectionReference.path;
    const newCollection = db.collection(`/gyms/aranha/${oldPath}`);
    const documents = await collectionReference.listDocuments();

    for ( const document of documents ) {
        const documentSnapshot = await document.get();
        const data = documentSnapshot.data();
        if ( data !== undefined ) {
            batch.set( newCollection.doc( document.id ), data );
        }
        const subCollections = await document.listCollections();
        for ( const collection of subCollections ) {
            await migrate( collection.path );
        }
    }

    await batch.commit();
}

export const migrateToMultiGym = async () => {
    console.info("migrate customers & del" );
    await migrate( "customers" );
    await dropCollection( "customers" );

    console.info("migrate global_history & del" );
    await migrate( "global_history" );
    await dropCollection( "global_history" );
    console.info("migrate lesson_instances & del" );
    await migrate( "lesson_instances" );
    await dropCollection( "lesson_instances" );
    console.info("migrate user_history & del" );
    await migrate( "users_history" );
    await dropCollection( "users_history" );

    console.info("del lesson_templates" );
    await dropCollection( "lesson_templates" );
    console.info("del subscription_plans" );
    await dropCollection( "subscription_plans" );
    console.info("del lessons" );
    await dropCollection( "lessons" );

    return Promise.resolve();
};
