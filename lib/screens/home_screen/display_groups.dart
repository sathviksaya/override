import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:override/models/user.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyTextField(
                controller: _searchController,
                hint: "Search groups...",
                icon: Icons.search,
                radius: 50,
              ),
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
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(Info.email)
            .collection('inGroups')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError) {
            return Center(
              child: SpinKitFadingCircle(
                size: 20,
                color: Colors.black54,
              ),
            );
          }
          if (snapshot.data!.docs.length == 0) {
            return Center(
              child: Text(
                'No groups to show..',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            );
          }
          return ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (itemBuilder, index) {
              var data = snapshot.data!.docs[index];
              return GroupCard(
                groupName: data['groupName'],
                description: data['description'],
                extension: data['extension'],
                groupId: data['groupId'],
                eventsNumber: 1,
              );
            },
          );
        },
      ),
    );
