import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class NewGroupDialog extends StatelessWidget {
  const NewGroupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      insetPadding: EdgeInsets.all(30),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dialoghead(context),
            SizedBox(
              height: 15,
            ),
            optionButton(
              context,
              'Create group',
              Icons.group_add,
              () {},
            ),
            SizedBox(
              height: 10,
            ),
            optionButton(
              context,
              'Join group',
              Icons.add_link,
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget dialoghead(BuildContext context) => Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            'New group',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          Spacer(),
          IconButton(
            splashRadius: 20,
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
          ),
        ],
      );
}

Widget optionButton(
  BuildContext context,
  String name,
  IconData icon,
  Function() onPressed,
) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        primary: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            name,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
