import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/auth_&_settings/link_button.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  List<List> devs = [
    [
      'Supreet Ronad',
      'Programmer | Software Development Enthusiast | CSE Undergraduate at PES University, Bangalore',
      'suppi.jpg',
      ['portfolio', 'https://supreetronad.github.io/web_portal/'],
      ['email', 'mailto:suppironad@gmail.com?subject=Hi Supreet!'],
      ['linkedin', 'https://www.linkedin.com/in/supreet-ronad/'],
      ['github', 'https://github.com/SupreetRonad'],
      ['insta', 'https://www.instagram.com/supreetronad/'],
    ],
    [
      'Sathvik Saya',
      'Flutter and Web Developer | CSE Undergraduate at PES University, Bangalore',
      'soya.jpg',
      ['email', 'mailto:sathviksaya@gmail.com?subject=Hi Sathvik!'],
      ['linkedin', 'http://www.linkedin.com/in/sathviksaya'],
      ['github', 'https://github.com/sathviksaya'],
      ['insta', 'https://www.instagram.com/sathviksaya/'],
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (List dev in devs) _devCard(dev),
        ],
      ),
    );
  }

  Widget _devCard(List dev) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        constraints: BoxConstraints(
          maxWidth: 470,
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/' + dev[2],
                height: 130,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dev[0],
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    dev[1],
                    style: GoogleFonts.montserrat(
                      color: Colors.white60,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    children: [
                      for (int i = 3; i < dev.length; i++)
                        LinkButton(img: dev[i][0], url: dev[i][1])
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
