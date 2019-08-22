import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = GoogleSignIn();
final auth = FirebaseAuth.instance;

Future<Null> ensureLoggedIn() async {
  GoogleSignInAccount user = googleSignIn.currentUser;

  if (user == null) user = await googleSignIn.signInSilently();

  if (user == null) user = await googleSignIn.signIn();

  if (await auth.currentUser() == null) {
    GoogleSignInAuthentication credentials =
        await googleSignIn.currentUser.authentication;
    await auth.signInWithCredential(
      GoogleAuthProvider.getCredential(
        idToken: credentials.idToken,
        accessToken: credentials.accessToken,
      ),
    );
  }
}

void sendMessage({String text, String imgUrl}) {
  Firestore.instance.collection("messages").add(
    {
      "text": text,
      "imgUrl": imgUrl,
      "senderName": googleSignIn.currentUser.displayName,
      "senderPhotoUrl": googleSignIn.currentUser.photoUrl,
    },
  );
}

saveFileOnFirebaseStorage(File imgFile) async {
  if (imgFile == null) return;

  StorageUploadTask task = FirebaseStorage.instance
      .ref()
      .child(googleSignIn.currentUser.id.toString() +
          DateTime.now().millisecondsSinceEpoch.toString())
      .putFile(imgFile);

  StorageTaskSnapshot taskSnapshot = await task.onComplete;
  String url = await taskSnapshot.ref.getDownloadURL();

  sendMessage(imgUrl: url);
}
