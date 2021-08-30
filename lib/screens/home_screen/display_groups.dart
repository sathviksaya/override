import 'package:flutter/material.dart';
import 'package:override/screens/widgets/group_card.dart';
import 'package:override/shared/my_textfield.dart';

class DisplayGroups extends StatelessWidget {
  const DisplayGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyTextField(
              controller: _searchController,
              hint: "Search groups...",
              icon: Icons.search,
              radius: 50,
            ),
            SizedBox(
              height: 10,
            ),
            showGroups(),
          ],
        ),
      ),
    );
  }
}

Widget showGroups() => Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GroupCard(
              name: "Class A, PESU",
              description: "Update of Class A",
              eventsNumber: 0,
            ),
            GroupCard(
              name: "Class A, PESU",
              description:
                  "Update of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class AUpdate of Class A",
              eventsNumber: 1,
            ),
            GroupCard(
              name: "Class A, PESU",
              description: "Update of Class A",
              eventsNumber: 2,
            ),
          ],
        ),
      ),
    );
