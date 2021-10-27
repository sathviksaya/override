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
    return Dialog(
      backgroundColor: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DialogHead(heading: 'Group credentials'),
              SizedBox(
                height: 20,
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
                height: 30,
              ),
              copyButton(
                groupId,
                extension,
              ),
            ],
          ),
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
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
