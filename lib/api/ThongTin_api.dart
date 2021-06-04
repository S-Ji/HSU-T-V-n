import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutterhoasen/model/ThongTin.dart';
import 'package:flutterhoasen/notifiel/ThongTinNotifiel.dart';

getInfoList(ThongTinNotifier thongTinNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('infomations').get();

  List<ThongTin> itemsList = [];

  snapshot.docs.forEach((document) {
    ThongTin thongTin = ThongTin.fromMap(document.data());
    itemsList.add(thongTin);
  });

  thongTinNotifier.infoList = itemsList;
}
