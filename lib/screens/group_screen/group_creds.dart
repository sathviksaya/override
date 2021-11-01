import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/widgets/dialog_head.dart';
import 'package:override/utils/show_msg.dart';

class GroupCreds extends StatelessWidget {
  final String groupId;
  final String extension;
  const GroupCreds({
    Key? key,
    required this.groupId,
    required this.extension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogHead(
              heading: 'Credentials',
              closeButtonEnabled: false,
            ),
            SizedBox(
              height: 10,
            ),
            showInfo(
              'Group Id',
              groupId,
            ),
            SizedBox(
              height: 20,
            ),
            showInfo(
              'Extension',
              extension,
            ),
            SizedBox(
              height: 10,
            ),
            copyButton(
              groupId,
              extension,
            ),
          ],
        ),
      ),
    );
  }

  Widget copyButton(String groupId, String extension) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(
                  text: "Group Id : $groupId \nExtension : $extension",
                ),
              );
              showToast('Copied to clipboard');
            },
            icon: Icon(
              Icons.copy,
              color: Colors.white54,
              size: 20,
            ),
          ),
        ],
      );

  Widget showInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 13,
            color: Colors.white54,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 17,
            color: Colors.blue[400],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
