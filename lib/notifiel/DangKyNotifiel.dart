import 'dart:collection';
import 'package:flutterhoasen/model/DangKy.dart';
import 'package:flutter/cupertino.dart';

class DangKyNotifier with ChangeNotifier {
  List<DangKy> _regisList = [];
  DangKy _currentRegis;

  UnmodifiableListView<DangKy> get regisList =>
      UnmodifiableListView(_regisList);

  DangKy get currentRegis => _currentRegis;

  set regisList(List<DangKy> regisList) {
    _regisList = regisList;
    notifyListeners();
  }

  set currentRegis(DangKy dangKy) {
    _currentRegis = dangKy;
    notifyListeners();
  }

  addRegis(DangKy dangKy) {
    _regisList.insert(0, dangKy);
    notifyListeners();
  }

  deleteRegis(DangKy dangKy) {
    _regisList.removeWhere((_dangKy) => _dangKy.id == dangKy.id);
    notifyListeners();
  }
}
