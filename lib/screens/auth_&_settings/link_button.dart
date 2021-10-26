import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatefulWidget {
  final String img;
  final String url;
  const LinkButton({Key? key, required this.img, required this.url})
      : super(key: key);

  @override
  _LinkButtonState createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      child: MouseRegion(
        onEnter: (p) {
          setState(() {
            hover = true;
          });
        },
        onExit: (p) {
          setState(() {
            hover = false;
          });
        },
        child: Opacity(
          opacity: hover ? 1 : 0.3,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0),
            ),
            onPressed: () {
              launch(widget.url);
            },
            child: Image.asset(
              'assets/images/${widget.img}.png',
              color: Colors.white,
              height: 17,
            ),
          ),
        ),
      ),
    );
  }
}
