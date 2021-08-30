import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/widgets/event_card.dart';

class DisplayEvents extends StatelessWidget {
  const DisplayEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            tab(context),
          ],
        ),
      ),
    );
  }

  Widget tab(BuildContext context) => DefaultTabController(
    initialIndex: 1,
    length: 3,    
    child: Column(
      children: [
        TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelStyle: GoogleFonts.roboto(
            fontSize: 15,
          ),
          unselectedLabelStyle: GoogleFonts.roboto(
            fontSize: 15,
          ),
          indicator: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          tabs: [
            Tab(
              child: Text("All"),
            ),
            Tab(
              child: Text("Today"),
            ),
            Tab(
              child: Text("Tomorrow"),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 500,
          child: TabBarView(
            children: [
              Text("kjakljda"),
              Text("kjakljda"),
              Text("kjakljda"),
            ],
          ),
        ),
      ],
    ),
  );

  Widget showEvents() => Expanded(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              EventCard(
                name: "Class A, PESUClass A,PESUClass A,PESUClass A,PESUC",
                tag: "tag",
                dateTime: DateTime.now(),
              ),
              EventCard(
                name: "Class A, PESUClass A,PESUClass A,PESUClass A,PESUC",
                tag: "tag",
                dateTime: DateTime.now(),
              ),
              EventCard(
                name: "Class A, PESUClass A,PESUClass A,PESUClass A,PESUC",
                tag: "tag",
                dateTime: DateTime.now(),
              )
            ],
          ),
        ),
      );
}
