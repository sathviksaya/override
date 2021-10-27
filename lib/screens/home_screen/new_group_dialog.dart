import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/widgets/dialog_head.dart';

import 'create_join_group_sheet.dart';

class NewGroupDialog extends StatelessWidget {
  const NewGroupDialog({Key? key}) : super(key: key);

  void showSheet(BuildContext context, bool flag) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => GroupDialog(create: flag),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      insetPadding: const EdgeInsets.all(30),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DialogHead(heading: 'New Group'),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  optionButton(
                    context,
                    'Create',
                    Icons.group_add,
                    () {
                      showSheet(context, true);
                    },
                  ),
                  Container(
                    width: 1,
                    height: 100,
                    color: Colors.black26,
                  ),
                  optionButton(
                    context,
                    'Join',
                    Icons.add_link,
                    () {
                      showSheet(context, false);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget optionButton(
  BuildContext context,
  String name,
  IconData icon,
  Function() onPressed,
) =>
    TextButton(
      style: TextButton.styleFrom(
        primary: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
      ),
      onPressed: onPressed,
      child: Container(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
