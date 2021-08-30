import 'package:flutter/material.dart';
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
            showEvents(),
          ],
        ),
      ),
    );
  }

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
