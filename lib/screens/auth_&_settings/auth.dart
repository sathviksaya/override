import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/widgets/sign_in_button.dart';
import 'package:override/utils/google_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class Auth extends StatefulWidget {
  Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.width.toString());
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          heading(),
          Image.asset(
            "assets/images/greetings.png",
            height: MediaQuery.of(context).size.shortestSide * 0.6,
          ),
        ],
      ),
    );
  }

  Widget signInButton(BuildContext context) => SizedBox(
        height: 55,
        width: 180,
        child: SignInButton(onPressed: signInWithGoogle),
      );

  Widget heading() => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '_ Welcome to',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Text(
              'Shareminder',
              style: GoogleFonts.pacifico(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                _des,
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white54,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            (MediaQuery.of(context).size.width > 500)
                ? signInButton(context)
                : _getApkButton()
          ],
        ),
      );

  Widget _getApkButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          primary: Colors.transparent,
          // shadowColor: Colors.white38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(0),
        ),
        onPressed: () async {
          launch(
              'https://play.google.com/store/apps/details?id=com.lairofdevs.override');
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey[200]!,
              ],
            ),
            border: Border.all(color: Colors.white),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.android_rounded,
                color: Colors.greenAccent,
                size: 30,
              ),
              const SizedBox(width: 15),
              Text(
                "Get the App",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );

  final String _des =
      'Reminders re-imagined to be shared among friends, family and closed ones to always be in connected and never miss any events.';
}
