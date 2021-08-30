import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String email;
  final String imgUrl;
  final bool isAdmin;
  const MemberCard({
    Key? key,
    required this.name,
    required this.email,
    required this.imgUrl,
    required this.isAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 30),
          displayPic(),
          SizedBox(width: 10),
          displayName(),
        ],
      ),
    );
  }

  Widget displayPic() {
    Widget image1, image2;
    image1 = Image.network(
      imgUrl,
      height: 50,
      fit: BoxFit.cover,
    );
    image2 = Image.asset(
      'assets/images/user.png',
      height: 50,
      fit: BoxFit.cover,
    );
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipOval(
          child: image2,
        ),
        ClipOval(
          child: image1,
        ),
      ],
    );
  }

  Widget displayName() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 15),
                if (isAdmin) displayAdmin(),
              ],
            ),
            Text(
              email,
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      );

  Widget displayAdmin() => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "Admin",
          style: GoogleFonts.roboto(
            color: Colors.green,
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
}
