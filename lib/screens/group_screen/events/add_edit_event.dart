import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:override/models/copy_event.dart';
import 'package:override/models/event.dart';
import 'package:override/models/user.dart';
import 'package:override/screens/group_screen/events/confirm_overwrite.dart';
import 'package:override/screens/widgets/dialog_head.dart';
import 'package:override/shared/my_textfield.dart';
import 'package:override/utils/event_funtions.dart';
import 'package:override/utils/show_msg.dart';

class AddEditEvent extends StatefulWidget {
  final bool newEvent;
  final Event? event;
  final String groupRef;
  AddEditEvent({
    Key? key,
    required this.newEvent,
    this.event,
    required this.groupRef,
  }) : super(key: key);

  @override
  State<AddEditEvent> createState() => _AddEditEventState();
}

class _AddEditEventState extends State<AddEditEvent> {
  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();

  DateTime? date;

  void _addEditEvent(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (date == null) {
      showToast('Please enter event name, tag and date!');
      return;
    }
    Event newEvent = Event(
      _eventController.text,
      _tagController.text,
      date,
      _infoController.text,
      Info.email!,
    );

    if (widget.newEvent) {
      Event? duplicateEvent =
          await checkDuplicateEvent(context, widget.groupRef, newEvent);

      if (duplicateEvent != null) {
        showDialog(
          context: context,
          builder: (builder) => ConfirmOverwrite(
            prevEvent: duplicateEvent,
            groupRef: widget.groupRef,
            event: newEvent,
          ),
        );
        return;
      }
    }

    editAddEvent(
      context,
      widget.groupRef,
      newEvent,
      widget.event,
      widget.newEvent,
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.event != null) {
      _eventController.text = widget.event!.eventName;
      _tagController.text = widget.event!.tag;
      _infoController.text = widget.event!.info;
      date = widget.event!.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DialogHead(
                  heading: widget.newEvent ? "New Event" : "Edit Event",
                ),
                widget.event == null ? SizedBox(height: 10) : addedBy(),
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
      ),
    );
  }

  Widget labeledField(
    String label,
    String hint,
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
    int minLines = 1,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: GoogleFonts.roboto(
                color: Colors.white54,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 5),
          MyTextField(
            fillColor: Colors.grey[800],
            inputType: inputType,
            controller: controller,
            hint: hint,
            maxLines: maxLines,
            minLines: minLines,
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
            maxLines: 5,
            minLines: 2,
          ),
          SizedBox(height: 10),
        ],
      );

  Widget addedBy() => Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Added by : ',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.normal,
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
            Text(
              widget.event!.addedBy,
              overflow: TextOverflow.fade,
              // maxLines: 1,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Colors.blue[400],
                fontSize: 13,
              ),
            ),
          ],
        ),
      );

  Widget pickDateTime() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Date & Time",
              style: GoogleFonts.roboto(
                color: Colors.white54,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[800],
            ),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Center(
              child: DateTimeField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range_rounded,
                    color: Colors.white54,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: 'Date and time',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                  ),
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
          if (CopiedEvent.event != null)
            TextButton(
              onPressed: () {
                setState(() {
                  _eventController.text = CopiedEvent.event!.eventName;
                  _tagController.text = CopiedEvent.event!.tag;
                  _infoController.text = CopiedEvent.event!.info;
                  date = CopiedEvent.event!.date;
                });
              },
              child: Text(
                "Paste event",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          Spacer(),
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
              _addEditEvent(context);
            },
          ),
        ],
      );
}
