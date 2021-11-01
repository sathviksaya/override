import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/models/group.dart';
import 'package:override/providers/group_provider.dart';
import 'package:override/screens/group_screen/events/add_edit_event.dart';
import 'package:override/screens/group_screen/group_Info.dart';
import 'package:override/screens/group_screen/group_tab_view.dart';
import 'package:override/screens/group_screen/display_members.dart';
import 'package:override/screens/group_screen/group_creds.dart';
import 'package:override/screens/group_screen/leave_group.dart';
import 'package:override/screens/widgets/dropdown_list.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GroupScreen extends StatelessWidget {
  GroupScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void showCreds(BuildContext context, int flag, Group grp) {
    showDialog(
      context: context,
      builder: (builder) {
        switch (flag) {
          case 0:
            return DisplayMembers(
              groupRef: grp.groupId + '###' + grp.extension,
            );

          case 1:
            return GroupCreds(
              groupId: grp.groupId,
              extension: grp.extension,
            );

          case 3:
            return LeaveGroup(
              groupName: grp.groupName,
              groupRef: grp.groupId + '###' + grp.extension,
            );

          default:
            return GroupCreds(
              groupId: grp.groupId,
              extension: grp.extension,
            );
        }
      },
    );
  }

  void showAddEventSheet(BuildContext context, Group grp) {
    showDialog(
      context: context,
      builder: (context) => AddEditEvent(
        newEvent: true,
        groupRef: grp.groupId + '###' + grp.extension,
        // event: event,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupProvider>(
      builder: (context, grp, _) {
        log('group screen changed');
        return grp.group == null
            ? _noGroupSelected()
            : Scaffold(
                key: _scaffoldKey,
                drawerEnableOpenDragGesture: false,
                endDrawer: GroupInfoSection(),
                backgroundColor: Colors.grey[900],
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.grey[850],
                  automaticallyImplyLeading: false,
                  title: Row(
                    children: [
                      backButton(context),
                      Spacer(),
                      Text(
                        grp.groupName,
                        style: GoogleFonts.roboto(
                          color: Colors.white70,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  actions: groupOptions(context, grp.group!),
                ),
                body: GroupTabView(
                  groupRef: grp.groupId + '###' + grp.extension,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showAddEventSheet(context, grp.group!);
                  },
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              );
      },
    );
  }

  Widget backButton(BuildContext context) => Consumer<GroupProvider>(
        builder: (context, grp, _) {
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: IconButton(
                  color: Colors.white70,
                  icon: Icon(Icons.close_rounded),
                  onPressed: () {
                    grp.reset();
                  },
                ),
              ),
            ],
          );
        },
      );

  List<Widget> groupOptions(BuildContext context, Group grp) => [
        IconButton(
          onPressed: () {
            // Scaffold.of(context).openEndDrawer();
            _scaffoldKey.currentState?.openEndDrawer();
          },
          icon: Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          ),
        ),
        // FilterMenu(
        //   options: groupMenu,
        //   optionIcons: groupMenuIcons,
        //   icon: Icons.more_vert,
        //   onSelect: (choice) {
        //     // FocusScope.of(context).requestFocus(new FocusNode());
        //     switch (choice) {
        //       case 'Members':
        //         showCreds(context, 0, grp);
        //         break;
        //       case 'Group Creds':
        //         showCreds(context, 1, grp);
        //         break;
        //       case 'Mute Events':
        //         break;
        //       case 'Leave Group':
        //         showCreds(context, 3, grp);
        //         break;
        //       default:
        //         break;
        //     }
        //   },
        // ),
      ];

  Widget _noGroupSelected() => Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Text(
            'No group selected!',
            style: GoogleFonts.montserrat(
              color: Colors.white54,
            ),
          ),
        ),
      );

  List<String> groupMenu = [
    'Members',
    'Group Creds',
    'Mute Events',
    'Leave Group'
  ];

  Map<String, List> groupMenuIcons = {
    'Members': [
      Icons.group,
      Colors.white,
    ],
    'Group Creds': [
      Icons.info,
      Colors.white,
    ],
    'Mute Events': [
      Icons.volume_off,
      Colors.white,
    ],
    'Leave Group': [
      Icons.exit_to_app,
      Colors.red[300],
    ],
  };
}
