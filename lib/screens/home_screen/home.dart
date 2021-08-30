import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/auth_&_settings/settings_screen.dart';
import 'package:override/screens/widgets/dropdown_list.dart';
import 'package:override/utils/google_auth.dart';
import 'package:override/utils/page_surf.dart';

import 'display_groups.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Shareminder',
          style: GoogleFonts.roboto(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: homeOption(context),
      ),
      body: DisplayGroups(),
    );
  }

  List<Widget> homeOption(BuildContext context) => [
        FilterMenu(
          options: homeMenu,
          optionIcons: homeMenuIcons,
          onSelect: (choice) {
            switch (choice) {
              case 'Settings':
                pushPage(context, Settings());
                break;
              case 'Logout':
                signOut(context);
                break;
              default:
                break;
            }
          },
        ),
      ];

  List<String> homeMenu = ['New group', 'Settings'];

  Map<String, List> homeMenuIcons = {
    'New group': [
      Icons.add,
      Colors.black87,
    ],
    'Settings': [
      Icons.settings,
      Colors.black87,
    ],
  };
}
