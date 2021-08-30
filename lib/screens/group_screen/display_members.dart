import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:override/screens/widgets/dialog_head.dart';

class DisplayMembers extends StatelessWidget {
  final String groupRef;
  const DisplayMembers({Key? key, required this.groupRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            children: [
              DialogHead(heading: 'Members'),
              membersList(context, groupRef),
            ],
          ),
        ),
      ),
    );
  }

  Widget membersList(BuildContext context, String groupRef) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('groups')
          .doc(groupRef)
          .collection('members')
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
              'No members...',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (itemBuilder, index) {
            var data = snapshot.data!.docs[index];
            return displayMember(
              data['name'],
              data['email'],
              data['imgUrl'],
              data['admin'],
            );
          },
        );
      },
    );
  }

  Widget displayMember(String name, String email, String imgUrl, bool isAdmin) {
    return Text(name);
  }
}
