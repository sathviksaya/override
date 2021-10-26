import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/models/group.dart';
import 'package:override/screens/group_screen/group_screen.dart';
import 'package:override/utils/page_surf.dart';

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

    return GestureDetector(
      onTap: () {
        pushPage(
          context,
          GroupScreen(
            groupId: groupId,
            groupName: groupName,
            extension: extension,
            group: group,
          ),
        );
      },
      child: Card(
        elevation: 20,
        shadowColor: Colors.white38,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.groupName,
                    maxLines: 1,
                    softWrap: false,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      "${this.description}\n",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    eventsToday,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color:
                          this.eventsNumber == 0 ? Colors.grey : Colors.amber,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
