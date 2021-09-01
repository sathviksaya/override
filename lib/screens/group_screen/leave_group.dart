import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:override/screens/widgets/dialog_head.dart';
import 'package:override/utils/group_functions.dart';

class LeaveGroup extends StatelessWidget {
  final String groupRef;
  final String groupName;
  const LeaveGroup({
    Key? key,
    required this.groupRef,
    required this.groupName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DialogHead(
                heading: 'Leave group',
              ),
              SizedBox(
                height: 10,
              ),
              showWarning(),
              SizedBox(
                height: 10,
              ),
              button(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(BuildContext context) {
    return TextButton(
      onPressed: () async {
        // Navigator.pop(context);
        await leaveGroup(context, groupRef);
      },
      child: Text(
        'Yes',
        style: TextStyle(
          fontSize: 15,
          color: Colors.red[300],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget showWarning() => Column(
        children: [
          Text(
            'Are you sure you want to leave the group',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            groupName + '?',
            style: TextStyle(
              fontSize: 17,
              color: Colors.red[300],
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      );
}
