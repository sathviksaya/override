import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/widgets/dropdown_list.dart';

class EventCard extends StatelessWidget {
  final String name;
  final String tag;
  final String? date;
  const EventCard({
    Key? key,
    required this.name,
    required this.tag,
    required this.date,
  }) : super(key: key);

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.green,
                       width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        this.name,
                        softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        this.tag,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                    child: Icon(Icons.more_horiz),
                    onTap: () {
                      eventOption(context);
                    }),
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
                      "8:30 AM",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      "Sun, 28 Aug 2021",
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

List<Widget> eventOption(BuildContext context) => [
      FilterMenu(
        options: eventMenu,
        optionIcons: eventMenuIcons,
        onSelect: (choice) {
          FocusScope.of(context).requestFocus(new FocusNode());
          switch (choice) {
            case 'Edit':
              break;
            case 'Add to Calendar':
              break;
            case 'Delete':
              break;
            default:
              break;
          }
        },
      ),
    ];

List<String> eventMenu = ['Edit', 'Add to Calendar', 'Delete event'];

Map<String, List> eventMenuIcons = {
  'Edit': [
    Icons.edit,
    Colors.black87,
  ],
  'Add to Calendar': [
    Icons.settings,
    Colors.black87,
  ],
  'Delete event': [
    Icons.delete,
    Colors.red[300],
  ],
};
