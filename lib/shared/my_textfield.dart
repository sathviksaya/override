import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextInputType? inputType;
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final double radius;
  final int lines;
  final bool? obscureText;
  final Function(String? val)? onChanged;
  const MyTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.icon,
    this.lines = 1,
    this.radius = 15,
    this.obscureText,
    this.onChanged,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.black54,
        onChanged: onChanged,
        maxLines: lines,
        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.all(15),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
          fillColor: Colors.grey[200],
          enabled: true,
          suffixIcon: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
