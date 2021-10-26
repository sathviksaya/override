import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  late String groupName;
  late String groupId;
  late String extension;
  late String description;
  late String groupRef;

  Group(
    String groupName,
    String groupId,
    String extension,
    String description,
  ) {
    this.groupName = groupName;
    this.groupId = groupId;
    this.extension = extension;
    this.description = description;
    this.groupRef = groupId + '###' + extension;
  }
}
