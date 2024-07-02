

import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';



admin.initializeApp();

export const onThreadCreadted = functions.firestore.document('thread/{threadId}').onCreate(async (snapshot, context) => {
 await snapshot.ref.update({hello:'from functions'});
 const spawn = require('child-process-promise').spawn;
 await spawn("ffmpeg")
});