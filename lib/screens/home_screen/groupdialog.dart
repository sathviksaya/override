import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/shared/my_textfield.dart';

class GroupDialog extends StatelessWidget {
  final bool create;
  GroupDialog({Key? key, required this.create}) : super(key: key);

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dialoghead(context),
            SizedBox(height: 20),
            dialogbody(context),
            Spacer(),
            submitButton(context),
          ],
        ),
      ),
    );
  }

  Widget dialoghead(BuildContext context) => Row(
        children: [
          Text(
            create ? 'Create Group' : 'Join Group',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 24,
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

  Widget dialogbody(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              create ? 'Group Name' : 'Group ID',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10),
            MyTextField(
              controller: controller1,
              hint: create ? "Enter the group name" : "Enter the group id",
            ),
            SizedBox(height: 20),
            Text(
              create ? 'Description' : 'Extension',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10),
            MyTextField(
              controller: controller2,
              lines: create ? 3 : 1,
              hint: create
                  ? "What the group is about..."
                  : "Enter the secret extension",
              obscureText: create ? false : true,
            ),
          ],
        ),
      );

  Widget submitButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: create
                ? () {
                    // TODO: create group function
                  }
                : () {
                    // TODO: join group function
                  },
          ),
        ],
      );
}
