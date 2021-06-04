import 'dart:collection';
import 'package:flutterhoasen/model/ThongTin.dart';
import 'package:flutter/cupertino.dart';

class ThongTinNotifier with ChangeNotifier {
  List<ThongTin> _infoList = [];
  ThongTin _currentInfo;

  UnmodifiableListView<ThongTin> get infoList =>
      UnmodifiableListView(_infoList);

  ThongTin get currentInfo => _currentInfo;

  set infoList(List<ThongTin> infoList) {
    _infoList = infoList;
    notifyListeners();
  }

  set currentInfo(ThongTin thongTin) {
    _currentInfo = thongTin;
    notifyListeners();
  }
}
