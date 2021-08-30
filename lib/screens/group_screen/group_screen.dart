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
        title: Text(
          'Shareminder',
          style: GoogleFonts.roboto(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: homeOption(context),
      ),
      body: DisplayEvents(),
    );
  }

  
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

  List<String> homeMenu = ['Members', 'Add People', 'Mute Events', 'Leave Group'];

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
      Icons.person_add,
      Colors.black87,
    ],
    'Leave Group': [
      Icons.exit_to_app,
      Colors.red[300],
    ],
  };
}
