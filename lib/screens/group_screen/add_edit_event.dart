import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:override/screens/widgets/dialog_head.dart';
import 'package:override/shared/my_textfield.dart';

class AddEditEvent extends StatefulWidget {
  final bool newEvent;
  final String? eventName;
  final String? eventTag;
  final String? eventInfo;
  final DateTime? eventDate;
  AddEditEvent({
    Key? key,
    required this.newEvent,
    this.eventName,
    this.eventTag,
    this.eventInfo,
    this.eventDate,
  }) : super(key: key);

  @override
  State<AddEditEvent> createState() => _AddEditEventState();
}

class _AddEditEventState extends State<AddEditEvent> {
  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();

  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DialogHead(
                heading: widget.newEvent ? "New Event" : "Edit Event",
              ),
              SizedBox(height: 20),
              dialogbody(context),
              SizedBox(
                height: 20,
              ),
              submitButton(context),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget labeledField(
    String label,
    String hint,
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: GoogleFonts.roboto(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 5),
          MyTextField(
            inputType: inputType,
            controller: controller,
            hint: hint,
          ),
        ],
      );

  Widget dialogbody(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labeledField(
            "Event Name",
            "My birthday..",
            _eventController,
          ),
          SizedBox(height: 10),
          labeledField(
            "Tag",
            "Birthday",
            _tagController,
          ),
          SizedBox(height: 10),
          pickDateTime(),
          SizedBox(height: 10),
          labeledField(
            "Additional Info",
            "Remeber to pick up the cake...",
            _infoController,
          ),
          SizedBox(height: 10),
        ],
      );

  Widget pickDateTime() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Date & Time",
              style: GoogleFonts.roboto(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Center(
              child: DateTimeField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range_rounded),
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: 'Date and time',
                  // hintStyle: TextStyle(
                  //   color: Colors.black45,
                  //   fontSize: 13,
                  // ),
                ),
                dateFormat: DateFormat("EE, dd MMM, h : mm a"),
                onDateSelected: (DateTime selectedDate) {
                  setState(() {
                    date = selectedDate;
                  });
                },
                selectedDate: date,
              ),
            ),
          ),
        ],
      );

  Widget submitButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: SizedBox(
              height: 30,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 10,
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              // TODO: add event logic
            },
          ),
        ],
      );
}