import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:override/models/user.dart';
import 'package:override/screens/auth_&_settings/auth.dart';
import 'package:override/screens/auth_&_settings/tab_bar.dart';
import 'package:override/screens/home_screen/home.dart';
import 'package:override/shared/loading.dart';
import 'package:override/utils/page_surf.dart';
import 'package:override/utils/shared_prefs.dart';
import 'package:override/web/web_home.dart';
import 'package:page_transition/page_transition.dart';

Future<void> signInWithGoogle(BuildContext context) async {
  loading(context);
  GoogleSignInAccount? googleUser;

  try {
    googleUser = await GoogleSignIn().signIn();
  } catch (e) {
    log(e.toString());
    Navigator.pop(context);
    return;
  }

  bool isSigned = await GoogleSignIn().isSignedIn();

  if (isSigned) {
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    await setAuth(signedIn: true);
    Info.name = googleUser.displayName;
    Info.email = googleUser.email;

    await storeDetails(
      name: googleUser.displayName ?? 'Loading..',
      email: googleUser.email,
      imgUrl: googleUser.photoUrl ?? 'Loading..',
    );

    FirebaseFirestore fbase = FirebaseFirestore.instance;

    bool userExists = false;

    await fbase.collection('users').doc(Info.email).get().then((value) {
      if (value.exists) {
        log('Old user');
        userExists = true;
      } else {
        log('New user');
      }
    });

    if (!userExists) {
      await fbase.collection('users').doc(Info.email).set({
        'email': Info.email,
        'name': Info.name,
        'imgUrl': Info.imgUrl,
      });
    }

    Navigator.pop(context);

    replacePage(context, WebHome());
    return;
  }

  Navigator.pop(context);
}

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
  await setAuth(signedIn: false);
  Navigator.pop(context);
  replacePage(
    context,
    TabBarScreen(),
    transitionType: PageTransitionType.leftToRight,
  );
}
