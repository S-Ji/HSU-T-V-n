import 'dart:collection';
import 'package:flutterhoasen/model/HocBong.dart';
import 'package:flutter/cupertino.dart';

class HocBongNotifier with ChangeNotifier {
  List<HocBong> _scholarshipList = [];
  HocBong _currentScholarship;

  UnmodifiableListView<HocBong> get scholarshipList =>
      UnmodifiableListView(_scholarshipList);

  HocBong get currentScholarship => _currentScholarship;

  set scholarshipList(List<HocBong> scholarshipList) {
    _scholarshipList = scholarshipList;
    notifyListeners();
  }

  set currentScholarship(HocBong hocBong) {
    _currentScholarship = hocBong;
    notifyListeners();
  }
}
