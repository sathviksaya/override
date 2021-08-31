import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:override/models/event.dart';
import 'package:override/shared/loading.dart';
import 'package:override/utils/show_msg.dart';

void editAddEvent(
  BuildContext context,
  String groupRef,
  Event event,
  Event? prevEvent,
  bool newEvent,
) async {
  if (event.eventName.trim().isEmpty ||
      event.date == null ||
      event.tag.trim().isEmpty) {
    showToast('Please enter event name, tag and date!');
    return;
  }

  loading(context);

  FirebaseFirestore fbase = FirebaseFirestore.instance;

  if (!newEvent) {
    await fbase
        .collection('groups')
        .doc(groupRef)
        .collection('events')
        .doc(prevEvent!.eventId)
        .delete();
  }

  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('events')
      .doc(event.eventId)
      .set(event.toJson());

  Navigator.pop(context);
  Navigator.pop(context);

  showSnack(
    context,
    newEvent ? 'Event added!' : 'Event modified!',
    color: Colors.green,
  );
}

void deleteEvent(
  BuildContext context,
  String groupRef,
  Event event,
) async {
  loading(context);

  FirebaseFirestore fbase = FirebaseFirestore.instance;
  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('events')
      .doc(event.eventId)
      .delete();

  Navigator.pop(context);
  Navigator.pop(context);

  showSnack(
    context,
    'Event deleted!',
    color: Colors.grey[300]!,
    textColor: Colors.red,
  );
}
