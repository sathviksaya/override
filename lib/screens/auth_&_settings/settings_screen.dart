import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/models/user.dart';
import 'package:override/screens/auth_&_settings/support.dart';
import 'package:override/utils/google_auth.dart';
import 'package:override/utils/page_surf.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      width: 380,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton(context),
          displayInfo(context),
          logoutButton(context),
          creaters(context),
        ],
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
                color: Colors.white,
              ),
            ),
          ),
          Text(
            Info.email ?? 'nope',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Colors.white60,
            ),
          ),
        ],
      );

  Widget displayPic(BuildContext context) {
    Widget image1, image2;
    image2 = Image.asset(
      'assets/images/user.png',
      height: MediaQuery.of(context).size.shortestSide * 0.3,
      fit: BoxFit.cover,
    );
    image1 = Container(
      color: Colors.white,
      child: Image.network(
        Info.imgUrl ?? 'https://dunnvision.com/files/2019/05/Profile-512.png',
        errorBuilder: (context, _, st) {
          return image2;
        },
        height: MediaQuery.of(context).size.shortestSide * 0.3,
        fit: BoxFit.cover,
      ),
    );

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipOval(
          child: image2,
        ),
        ClipOval(
          child: image1,
        ),
      ],
    );
  }

  Widget backButton(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );

  Widget creaters(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          onPressed: () {
            pushPage(
              context,
              Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                backgroundColor: Colors.grey[900],
                body: SupportScreen(),
              ),
            );
          },
          child: Text(
            'About developers',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Colors.white38,
            ),
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
