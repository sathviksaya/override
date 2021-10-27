import 'package:flutter/material.dart';
import 'package:override/models/group.dart';
import 'package:override/providers/group_provider.dart';
import 'package:override/screens/group_screen/group_screen.dart';
import 'package:override/web/groups_section.dart';
import 'package:provider/provider.dart';

class WebHome extends StatefulWidget {
  const WebHome({Key? key}) : super(key: key);
  static Group? selectedGroup;

  @override
  State<WebHome> createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GroupProvider(),
      child: Row(
        children: [
          GroupSection(),
          Expanded(child: GroupScreen()),
        ],
      ),
    );
  }

  Widget noGroupSelected() => Center(
        child: Text('No group selecteed..'),
      );
}
