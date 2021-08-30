import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final double radius;
  const MyTextField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.radius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        cursorColor: Colors.black54,
        onChanged: (String? val) {
          controller.text = val!;
        },
        style: TextStyle(color: Colors.black54),
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
