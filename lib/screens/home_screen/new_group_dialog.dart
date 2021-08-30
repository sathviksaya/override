import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import 'groupdialog.dart';

class NewGroupDialog extends StatelessWidget {
  const NewGroupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
              dialoghead(context),
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
                      Navigator.of(context).pop();
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        context: context,
                        builder: (context) => GroupDialog(create: true),
                      );
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
                      Navigator.of(context).pop();
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        context: context,
                        builder: (context) => GroupDialog(create: false),
                      );
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
          icon: Icon(
            Icons.close,
          ),
        ),
      ],
    );

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
              color: Colors.black,
              size: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
