import 'package:flutter/material.dart';
import 'package:override/models/group.dart';

class GroupProvider extends ChangeNotifier {
  late String groupId;
  late String groupName;
  late String extension;
  Group? group;

  void setGroup(String gId, String gName, String ext, Group grp) {
    this.groupId = gId;
    this.groupName = gName;
    this.extension = ext;
    this.group = grp;

    notifyListeners();
  }

  void reset() {
    this.group = null;

    notifyListeners();
  }
}
