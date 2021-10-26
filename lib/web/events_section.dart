import 'package:flutter/material.dart';
import 'package:override/screens/group_screen/display_members.dart';
import 'package:override/screens/group_screen/events/add_edit_event.dart';
import 'package:override/screens/group_screen/group_creds.dart';
import 'package:override/screens/group_screen/leave_group.dart';

class EventsSection extends StatelessWidget {
  final String groupId;
  final String groupName;
  final String extension;
  const EventsSection({
    Key? key,
    required this.groupId,
    required this.groupName,
    required this.extension,
  }) : super(key: key);

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

  void showAddEventSheet(BuildContext context) {
    // Event event = Event(
    //   'Supreet',
    //   'Hello',
    //   DateTime.now(),
    //   'Extra...',
    //   Info.email!,
    // );
    showDialog(
      context: context,
      builder: (context) => AddEditEvent(
        newEvent: true,
        groupRef: groupId + '###' + extension,
        // event: event,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
