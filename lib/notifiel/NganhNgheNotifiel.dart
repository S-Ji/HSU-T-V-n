import 'dart:collection';
import 'package:flutterhoasen/model/NganhNghe.dart';
import 'package:flutter/cupertino.dart';

class NganhNgheNotifier with ChangeNotifier {
  List<NganhNghe> _careerList = [];
  NganhNghe _currentCareer;

  UnmodifiableListView<NganhNghe> get careerList =>
      UnmodifiableListView(_careerList);

  NganhNghe get currentCareer => _currentCareer;

  set careerList(List<NganhNghe> careerList) {
    _careerList = careerList;
    notifyListeners();
  }

  set currentCareer(NganhNghe nganhNghe) {
    _currentCareer = nganhNghe;
    notifyListeners();
  }
}
