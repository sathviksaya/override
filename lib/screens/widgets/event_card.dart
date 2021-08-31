import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:override/models/event.dart';
import 'package:override/screens/group_screen/events/add_edit_event.dart';
import 'package:override/screens/group_screen/events/confirm_delete.dart';
import 'package:override/screens/widgets/dropdown_list.dart';

class EventCard extends StatelessWidget {
  final String groupRef;
  final Event event;
  const EventCard({
    Key? key,
    required this.groupRef,
    required this.event,
  }) : super(key: key);

  void _eventOption(BuildContext context, int flag) {
    showDialog(
      context: context,
      builder: (builder) {
        switch (flag) {
          case 0:
            return AddEditEvent(
              newEvent: false,
              groupRef: groupRef,
              event: event,
            );

          case 2:
            return ConfirmDeleteEvent(event: event, groupRef: groupRef);

          default:
            return Dialog(child: Container());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.eventName,
                        // softWrap: true,
                        overflow: TextOverflow.fade,
                        // maxLines: 1,
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        event.tag,
                        // softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                FilterMenu(
                  options: eventMenu,
                  optionIcons: eventMenuIcons,
                  icon: Icons.more_horiz,
                  onSelect: (choice) {
                    // FocusScope.of(context).requestFocus(new FocusNode());
                    switch (choice) {
                      case 'Edit':
                        _eventOption(context, 0);
                        break;
                      case 'Add to Calendar':
                        print("Add to Calendar");
                        break;
                      case 'Delete event':
                        _eventOption(context, 2);
                        break;
                      default:
                        break;
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat.jm().format(event.date!),
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMEd().format(event.date!),
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<String> eventMenu = [
  'Edit',
  'Add to Calendar',
  'Delete event',
];

Map<String, List> eventMenuIcons = {
  'Edit': [
    Icons.edit,
    Colors.black87,
  ],
  'Add to Calendar': [
    Icons.calendar_today,
    Colors.black87,
  ],
  'Delete event': [
    Icons.delete,
    Colors.red[300],
  ],
};
