import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:override/screens/widgets/event_card.dart';

class GroupTabView extends StatelessWidget {
  const GroupTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: tab(context),
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
              indicatorPadding: EdgeInsets.all(10),
              labelPadding: EdgeInsets.all(5),
              unselectedLabelColor: Colors.grey,
              labelStyle: GoogleFonts.roboto(
                fontSize: 15,
              ),
              unselectedLabelStyle: GoogleFonts.roboto(
                fontSize: 15,
              ),
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(13),
              ),
              tabs: const [
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
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Text("All Events"),
                  ),
                  Center(
                    child: Text("Events Today"),
                  ),
                  Center(
                    child: Text("Events Tomorrow"),
                  ),
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
