// If there is already an event

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:override/models/event.dart';
import 'package:override/screens/widgets/dialog_head.dart';
import 'package:override/utils/event_funtions.dart';

class ConfirmOverwrite extends StatelessWidget {
  final Event prevEvent;
  final Event event;
  final String groupRef;
  const ConfirmOverwrite({
    Key? key,
    required this.prevEvent,
    required this.groupRef,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogHead(
              heading: 'Overwrite event',
            ),
            SizedBox(
              height: 10,
            ),
            showWarning(),
            SizedBox(
              height: 10,
            ),
            showDate(),
            SizedBox(
              height: 10,
            ),
            button(context),
          ],
        ),
      ),
    );
  }

  Widget button(BuildContext context) {
    return TextButton(
      onPressed: () async {
        editAddEvent(
          context,
          groupRef,
          event,
          null,
          true,
          replace: true,
        );
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
            'There is already an event added by you at the same time. Are you sure you want to overwrite the event',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            prevEvent.eventName + '?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              // color: Colors.red[300],
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      );

  Widget showDate() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateFormat.jm().format(prevEvent.date!),
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.amber,
            ),
          ),
          Text(
            DateFormat.yMMMEd().format(prevEvent.date!),
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      );
}
