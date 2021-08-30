import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/group_screen/group_tab_view.dart';
import 'package:override/screens/group_screen/display_members.dart';
import 'package:override/screens/group_screen/group_creds.dart';
import 'package:override/screens/group_screen/leave_group.dart';
import 'package:override/screens/widgets/dropdown_list.dart';

// ignore: must_be_immutable
class GroupScreen extends StatelessWidget {
  final String groupId;
  final String groupName;
  final String extension;
  GroupScreen(
      {Key? key,
      required this.groupId,
      required this.groupName,
      required this.extension})
      : super(key: key);

  void showCreds(BuildContext context, int flag) {
    showDialog(
      context: context,
      builder: (builder) {
        switch (flag) {
          case 0:
            return DisplayMembers(groupRef: groupId + '###' + extension);

          case 1:
            return GroupCreds(
              groupId: groupId,
              extension: extension,
            );

          case 3:
            return LeaveGroup(
              groupName: groupName,
              groupRef: groupId + '###' + extension,
            );

          default:
            return GroupCreds(
              groupId: groupId,
              extension: extension,
            );
        }
      },
    );
  }

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
        actions: groupOptions(context),
      ),
      body: GroupTabView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget backButton(BuildContext context) => Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
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

  List<Widget> groupOptions(BuildContext context) => [
        FilterMenu(
          options: groupMenu,
          optionIcons: groupMenuIcons,
          icon: Icons.more_vert,
          onSelect: (choice) {
            FocusScope.of(context).requestFocus(new FocusNode());
            switch (choice) {
              case 'Members':
                showCreds(context, 0);
                break;
              case 'Add People':
                showCreds(context, 1);
                break;
              case 'Mute Events':
                break;
              case 'Leave Group':
                showCreds(context, 3);
                break;
              default:
                break;
            }
          },
        ),
      ];

  List<String> groupMenu = [
    'Members',
    'Add People',
    'Mute Events',
    'Leave Group'
  ];

  Map<String, List> groupMenuIcons = {
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