import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
