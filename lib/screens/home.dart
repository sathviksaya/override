import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/settings_screen.dart';
import 'package:override/screens/widgets/dropdown_list.dart';
import 'package:override/shared/group_card.dart';
import 'package:override/shared/my_textfield.dart';
import 'package:override/utils/google_auth.dart';
import 'package:override/utils/page_surf.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  TextEditingController _searchController = TextEditingController();

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
        actions: [
          FilterMenu(
            options: home_menu,
            optionIcons: home_menu_icons,
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyTextField(
              controller: _searchController,
              hint: "Search groups...",
              icon: Icons.search,
              myBorderRadius: 50,
            ),
            SizedBox(
              height: 10,
            ),
            GroupCard(
              name: "Class A, PESU",
              description: "Update of Class A",
              eventsNumber: 0,
            ),
            GroupCard(
              name: "Class A, PESU",
              description:
                  "Update of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class A",
              eventsNumber: 1,
            ),
            GroupCard(
              name: "Class A, PESU",
              description: "Update of Class A",
              eventsNumber: 2,
            ),
          ],
        ),
      ),
    );
  }

  List<String> home_menu = ['Settings'];

  Map<String, List> home_menu_icons = {
    'Settings': [
      Icons.settings,
      Colors.black87,
    ],
    'Logout': [
      Icons.logout,
      Colors.red[300],
    ],
  };
}
