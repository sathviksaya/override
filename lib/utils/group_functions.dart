import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:override/models/user.dart';
import 'package:override/shared/loading.dart';
import 'package:override/utils/show_msg.dart';

void createGroup(
    BuildContext context, String groupName, String description) async {
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

  await fbase.collection('groups').doc(groupRef).set({
    'groupName': groupName,
    'description': description,
    'groupId': Info.email,
    'extension': extension,
    'admin': [
      {
        'email': Info.email,
        'name': Info.name,
        'imgUrl': Info.imgUrl,
      },
    ],
    'users': [
      {
        'email': Info.email,
        'name': Info.name,
        'imgUrl': Info.imgUrl,
      },
    ],
  });

  Navigator.pop(context);
  Navigator.pop(context);
  showSnack(
    context,
    'Group created successfully!',
    color: Colors.green,
  );
}
