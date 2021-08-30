import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showSnack(
  BuildContext context,
  String msg, {
  Color color = Colors.amber,
  Color textColor = Colors.white,
}) {
  final snackBar = SnackBar(
    backgroundColor: color,
    content: Text(
      msg,
      style: TextStyle(
        color: textColor,
      ),
    ),
    duration: const Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showToast(
  String msg, {
  Color bgColor = Colors.white,
  Color textColor = Colors.black87,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: bgColor,
    textColor: textColor,
    fontSize: 15,
  );
}
