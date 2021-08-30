import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:override/utils/page_surf.dart';
import 'package:override/utils/shared_prefs.dart';
import 'screens/auth_&_settings/auth.dart';
import 'screens/home_screen/home.dart';

class Diverge extends StatefulWidget {
  const Diverge({Key? key}) : super(key: key);

  @override
  _DivergeState createState() => _DivergeState();
}

class _DivergeState extends State<Diverge> {
  void divergeScreen() async {
    bool signedIn = await checkAuth();
    if (signedIn) {
      replacePage(context, Home());
    } else {
      replacePage(context, Auth());
    }
  }

  @override
  Widget build(BuildContext context) {
    divergeScreen();
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.black54,
          size: 20,
        ),
      ),
    );
  }
}
