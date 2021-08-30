import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/models/user.dart';
import 'package:override/utils/google_auth.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton(context),
            displayInfo(context),
            logoutButton(context),
            creaters(),
          ],
        ),
      ),
    );
  }

  Widget displayInfo(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          displayPic(context),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              Info.name ?? 'nope',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Text(
            Info.email ?? 'nope',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
        ],
      );

  Widget displayPic(BuildContext context) {
    Widget image;
    try {
      image = Image.network(
        Info.imgUrl ?? '',
        height: MediaQuery.of(context).size.shortestSide * 0.3,
        fit: BoxFit.cover,
      );
    } catch (e) {
      image = Image.asset(
        'assets/images/user.png',
        height: MediaQuery.of(context).size.shortestSide * 0.3,
        fit: BoxFit.cover,
      );
    }
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Center(
          child: SpinKitFadingCircle(
            color: Colors.black54,
            size: 20,
          ),
        ),
        ClipOval(
          child: image,
        ),
      ],
    );
  }

  Widget backButton(BuildContext context) => Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: IconButton(
              color: Colors.black87,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      );

  Widget creaters() => Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Created by Supreet & Sathvik',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: Colors.black38,
          ),
        ),
      );

  Widget logoutButton(BuildContext context) => TextButton(
        style: TextButton.styleFrom(
          primary: Colors.red[300],
        ),
        onPressed: () {
          signOut(context);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.logout,
              color: Colors.red[300],
            ),
            SizedBox(
              width: 15,
            ),
            Text('Logout'),
          ],
        ),
      );
}
