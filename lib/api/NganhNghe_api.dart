import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutterhoasen/model/NganhNghe.dart';
import 'package:flutterhoasen/notifiel/NganhNgheNotifiel.dart';

getCareerList(NganhNgheNotifier nganhNgheNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('major').get();

  List<NganhNghe> itemsList = [];

  snapshot.docs.forEach((document) {
    NganhNghe nganhNghe = NganhNghe.fromMap(document.data());
    itemsList.add(nganhNghe);
  });

  nganhNgheNotifier.careerList = itemsList;
}
