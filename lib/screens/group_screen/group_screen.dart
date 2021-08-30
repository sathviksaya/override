import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/group_screen/display_events.dart';
import 'package:override/screens/widgets/dropdown_list.dart';

// ignore: must_be_immutable
class GroupScreen extends StatelessWidget {
  final String groupId;
  final String groupName;
  GroupScreen({Key? key, required this.groupId, required this.groupName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            backButton(context),
            Spacer(),
            Text(
              groupName,
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: homeOption(context),
      ),
      body: DisplayEvents(),
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

  List<Widget> homeOption(BuildContext context) => [
        FilterMenu(
          options: homeMenu,
          optionIcons: homeMenuIcons,
          icon: Icons.more_vert,
          onSelect: (choice) {
            FocusScope.of(context).requestFocus(new FocusNode());
            switch (choice) {
              case 'Members':
                break;
              case 'Add People':
                break;
              case 'Mute Events':
                break;
              case 'Leave Group':
                break;
              default:
                break;
            }
          },
        ),
      ];

  List<String> homeMenu = [
    'Members',
    'Add People',
    'Mute Events',
    'Leave Group'
  ];

  Map<String, List> homeMenuIcons = {
    'Members': [
      Icons.group,
      Colors.black87,
    ],
    'Add People': [
      Icons.person_add,
      Colors.black87,
    ],
    'Mute Events': [
      Icons.volume_mute,
      Colors.black87,
    ],
    'Leave Group': [
      Icons.exit_to_app,
      Colors.red[300],
    ],
  };
}
