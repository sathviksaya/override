import 'package:flutter/material.dart';
import 'package:override/models/group.dart';
import 'package:override/web/groups_section.dart';

class WebHome extends StatefulWidget {
  const WebHome({Key? key}) : super(key: key);
  static Group? selectedGroup;

  @override
  State<WebHome> createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GroupSection(
          setGroup: () {},
        ),
        // WebHome.selectedGroup == null ? noGroupSelected() :
      ],
    );
  }

  Widget noGroupSelected() => Center(
        child: Text('No group selecteed..'),
      );
}
