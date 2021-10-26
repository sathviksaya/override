import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/auth_&_settings/auth.dart';
import 'package:override/screens/auth_&_settings/support.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            _tabBar(),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Auth(),
                  SupportScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 40),
            width: 160,
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: TabBar(
                enableFeedback: false,
                labelPadding: EdgeInsets.symmetric(horizontal: 5),
                isScrollable: false,
                labelColor: Colors.white70,
                unselectedLabelColor: Colors.white38,
                labelStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: Colors.white30,
                  fontWeight: FontWeight.w300,
                ),
                indicatorColor: Colors.transparent,
                tabs: [
                  Text(
                    'Home',
                  ),
                  Text(
                    'Support',
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
