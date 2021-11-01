import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/providers/group_provider.dart';
import 'package:override/screens/group_screen/display_members.dart';
import 'package:override/screens/group_screen/group_creds.dart';
import 'package:override/screens/group_screen/leave_group.dart';
import 'package:provider/provider.dart';

class GroupInfoSection extends StatelessWidget {
  const GroupInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          // color: Colors.grey[850],
          ),
      child: Consumer<GroupProvider>(
        builder: (context, grp, _) {
          return Column(
            children: [
              _section(child: _header(context)),
              _section(
                child: GroupCreds(
                  groupId: grp.groupId,
                  extension: grp.extension,
                ),
              ),
              // Divider(
              //   color: Colors.white12,
              // ),
              Expanded(
                child: _section(
                  child: DisplayMembers(
                    groupRef: grp.groupId + '###' + grp.extension,
                  ),
                ),
              ),
              _section(
                padded: false,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (builder) {
                        return LeaveGroup(
                          groupName: grp.groupName,
                          groupRef: grp.groupId + '###' + grp.extension,
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.exit_to_app_rounded,
                        color: Colors.red[300],
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Leave group',
                        style: TextStyle(
                          color: Colors.red[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _section({required Widget child, bool padded = true}) => Container(
        padding: padded
            ? EdgeInsets.symmetric(vertical: 10, horizontal: 10)
            : EdgeInsets.all(0),
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      );

  Widget _header(BuildContext context) => Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Text(
            'Group information',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      );
}
