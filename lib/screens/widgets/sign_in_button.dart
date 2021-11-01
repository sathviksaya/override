import 'package:flutter/material.dart';

class SignInButton extends StatefulWidget {
  final Function(BuildContext context) onPressed;
  const SignInButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  double _width = 170;
  double _height = 50;
  @override
  Widget build(BuildContext context) {
    bool _hovering = _width != 170;
    return MouseRegion(
      onEnter: (p) {
        setState(() {
          _width = _width + 10;

          _height = _height + 5;
        });
      },
      onExit: (p) {
        setState(() {
          _width = _width - 10;
          _height = _height - 5;
        });
      },
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(0),
          primary: _hovering ? Colors.white : Colors.transparent,
          backgroundColor: _hovering ? Colors.white : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () async {
          await widget.onPressed(context);
        },
        child: AnimatedContainer(
          height: _height,
          width: _width,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white),
          ),
          duration: const Duration(milliseconds: 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/google.png",
                height: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  color: _hovering ? Colors.black54 : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
