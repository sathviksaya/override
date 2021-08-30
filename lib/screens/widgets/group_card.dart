import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupCard extends StatelessWidget {
  final String name;
  final String description;
  final int eventsNumber;
  const GroupCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.eventsNumber})
      : super(key: key);

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.name,
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
                    color: this.eventsNumber == 0 ? Colors.grey : Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
