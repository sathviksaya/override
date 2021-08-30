import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:override/models/user.dart';
import 'package:override/shared/loading.dart';
import 'package:override/utils/show_msg.dart';

void createGroup(
  BuildContext context,
  String groupName,
  String description,
) async {
  loading(context);

  if (groupName.isEmpty) {
    showToast('Please enter group name');
    Navigator.pop(context);
    return;
  }

  log(groupName + '  ' + description);

  int time = DateTime.now().millisecondsSinceEpoch;
  String extension = (time / 1000).toStringAsFixed(0);

  log(time.toString() + '\n' + extension);

  FirebaseFirestore fbase = FirebaseFirestore.instance;

  String groupRef = Info.email! + '###' + extension;

  // Create group in groups
  await fbase.collection('groups').doc(groupRef).set({
    'groupName': groupName,
    'description': description,
    'groupId': Info.email,
    'extension': extension,
  });

  // Add user to members
  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('members')
      .doc(Info.email)
      .set({
    'email': Info.email,
    'name': Info.name,
    'imgUrl': Info.imgUrl,
    'admin': true,
  });

  // Add group to user's grouplist
  await fbase
      .collection('users')
      .doc(Info.email)
      .collection('inGroups')
      .doc(groupRef)
      .set({
    'groupName': groupName,
    'description': description,
    'gorupRef': groupRef,
    'groupId': Info.email,
    'extension': extension,
  });

  Navigator.pop(context);
  Navigator.pop(context);
  showSnack(
    context,
    'Group created successfully!',
    color: Colors.green,
  );
}

void joinGroup(
  BuildContext context,
  String groupId,
  String extension,
) async {
  loading(context);

  if (groupId.isEmpty || extension.isEmpty) {
    showToast('Please enter Group Id and Extension');
    Navigator.pop(context);
    return;
  }

  String groupRef = groupId + '###' + extension;

  FirebaseFirestore fbase = FirebaseFirestore.instance;

  await fbase.collection('groups').doc(groupRef).get().then((value) async {
    if (value.exists) {
      await addUserToGroup(
          context, groupRef, value['groupName'], value['description']);
    } else {
      showToast('No group found!');
    }
  });

  Navigator.pop(context);
}

Future<void> addUserToGroup(
  BuildContext context,
  String groupRef,
  String groupName,
  String description,
) async {
  FirebaseFirestore fbase = FirebaseFirestore.instance;

  // Check if user already in group
  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('members')
      .doc(Info.email)
      .get()
      .then((value) {
    if (value.exists) {
      showToast('You are already in the group!');
      return;
    }
  });

  // Add user into group members
  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('members')
      .doc(Info.email)
      .set({
    'email': Info.email,
    'name': Info.name,
    'imgUrl': Info.imgUrl,
    'admin': false,
  });

  // Add group into user's group list
  await fbase
      .collection('users')
      .doc(Info.email)
      .collection('inGroups')
      .doc(groupRef)
      .set({
    'groupName': groupName,
    'description': description,
    'gorupRef': groupRef,
    'groupId': groupRef.split('###')[0],
    'extension': groupRef.split('###')[1],
  });

  Navigator.pop(context);
  showSnack(
    context,
    'Added!',
    color: Colors.green,
  );
}

Future<void> leaveGroup(BuildContext context, String groupRef) async {
  loading(context);

  FirebaseFirestore fbase = FirebaseFirestore.instance;

  await fbase
      .collection('users')
      .doc(Info.email)
      .collection('inGroups')
      .doc(groupRef)
      .delete();

  await fbase
      .collection('groups')
      .doc(groupRef)
      .collection('members')
      .doc(Info.email)
      .delete();

  Navigator.pop(context);
  Navigator.pop(context);
  Navigator.pop(context);
}
