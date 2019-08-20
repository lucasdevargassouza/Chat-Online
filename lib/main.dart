import 'package:chat_online/pages/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  Firestore.instance
      .collection("teste")
      .document("teste")
      .setData({"teste": "teste"});

  runApp(App());
}

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

final googleSignIn = GoogleSignIn();
final auth = FirebaseAuth.instance;

Future<Null> _ensureLoggedIn() async {
  GoogleSignInAccount user = googleSignIn.currentUser;

  if (user == null) user = await googleSignIn.signInSilently();

  if (user == null) user = await googleSignIn.signIn();

  if (await auth.currentUser() == null) {
    GoogleSignInAuthentication credentials = await googleSignIn.currentUser.authentication;
    await auth.signInWithCredential(
      GoogleAuthProvider.getCredential(
        idToken: credentials.idToken,
        accessToken: credentials.accessToken,
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Online",
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).platform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      home: ChatScreen(),
    );
  }
}
