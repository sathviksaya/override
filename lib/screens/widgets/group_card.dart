import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/models/group.dart';
import 'package:override/providers/group_provider.dart';
import 'package:override/screens/group_screen/group_screen.dart';
import 'package:override/utils/page_surf.dart';
import 'package:provider/provider.dart';

class GroupCard extends StatelessWidget {
  final Group group;
  final String groupName;
  final String groupId;
  final String description;
  final String extension;
  final int eventsNumber;
  const GroupCard({
    Key? key,
    required this.groupName,
    required this.description,
    required this.eventsNumber,
    required this.extension,
    required this.groupId,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String eventsToday;
    if (eventsNumber == 0) {
      eventsToday = "No events for today..";
    } else if (eventsNumber == 1) {
      eventsToday = "${this.eventsNumber} Event for today..";
    } else {
      eventsToday = "${this.eventsNumber} Events for today..";
    }

    return Consumer<GroupProvider>(
      builder: (context, grp, _) {
        bool _isSelected = grp.group != null &&
            (grp.groupId + grp.extension) == (groupId + extension);
        return ElevatedButton(
          onPressed: () {
            grp.setGroup(groupId, groupName, extension, group);
            log(group.groupId);
          },
          style: ElevatedButton.styleFrom(
            primary: _isSelected ? Colors.grey[800] : Colors.grey[850],
            elevation: (_isSelected) ? 10 : 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      this.groupName,
                      maxLines: 1,
                      softWrap: false,
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 380 * 0.6,
                      child: Text(
                        "${this.description}\n",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.end,
//   children: [
//     Text(
//       eventsToday,
//       style: GoogleFonts.roboto(
//         fontSize: 12,
//         fontWeight: FontWeight.w600,
//         color:
//             this.eventsNumber == 0 ? Colors.grey : Colors.amber,
//       ),
//     ),
//   ],
// ),
