import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/auth_&_settings/settings_screen.dart';
import 'package:override/screens/home_screen/display_groups.dart';
import 'package:override/screens/home_screen/new_group_dialog.dart';
import 'package:override/screens/widgets/dropdown_list.dart';
import 'package:override/utils/page_surf.dart';

// ignore: must_be_immutable
class GroupSection extends StatelessWidget {
  GroupSection({Key? key}) : super(key: key);

  void showNewGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return NewGroupDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black45,
            width: 0.5,
          ),
        ),
      ),
      width: 380,
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Shareminder',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: homeOption(context),
        ),
        body: DisplayGroups(),
      ),
    );
  }

  List<Widget> homeOption(BuildContext context) => [
        FilterMenu(
          options: homeMenu,
          optionIcons: homeMenuIcons,
          icon: Icons.more_vert,
          onSelect: (choice) {
            // FocusScope.of(context).requestFocus(new FocusNode());
            switch (choice) {
              case 'Settings':
                pushPage(context, Settings());
                break;
              case 'New group':
                showNewGroupDialog(context);
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
      Colors.white,
    ],
    'Settings': [
      Icons.settings,
      Colors.white,
    ],
  };
}
