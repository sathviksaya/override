import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogHead extends StatelessWidget {
  final String heading;
  final Color? headingColor;
  final bool closeButtonEnabled;
  const DialogHead({
    Key? key,
    required this.heading,
    this.headingColor = Colors.white,
    this.closeButtonEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            heading,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: headingColor,
            ),
          ),
          Spacer(),
          if (closeButtonEnabled)
            IconButton(
              splashRadius: 20,
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
