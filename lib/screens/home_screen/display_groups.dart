import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:override/models/user.dart';
import 'package:override/screens/widgets/group_card.dart';
import 'package:override/shared/my_textfield.dart';

class DisplayGroups extends StatefulWidget {
  const DisplayGroups({Key? key}) : super(key: key);

  @override
  _DisplayGroupsState createState() => _DisplayGroupsState();
}

class _DisplayGroupsState extends State<DisplayGroups> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 5),
              child: Row(
                children: [
                  Flexible(
                    child: MyTextField(
                      controller: _searchController,
                      hint: "Search groups...",
                      radius: 50,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  if (_searchController.text.isNotEmpty)
                    IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            showGroups(_searchController.text),
          ],
        ),
      ),
    );
  }
}

Widget showGroups(String groupName) => Expanded(
      child: StreamBuilder(
        stream: groupName.isEmpty
            ? FirebaseFirestore.instance
                .collection('users')
                .doc(Info.email)
                .collection('inGroups')
                .snapshots()
            : FirebaseFirestore.instance
                .collection('users')
                .doc(Info.email)
                .collection('inGroups')
                .where('groupName', isEqualTo: groupName)
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
                eventsNumber: Random().nextInt(4),
              );
            },
          );
        },
      ),
    );
