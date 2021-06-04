import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutterhoasen/model/HocBong.dart';
import 'package:flutterhoasen/notifiel/HocBongNotifiel.dart';

getScholarshipList(HocBongNotifier hocBongNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('scholarships').get();

  List<HocBong> itemsList = [];

  snapshot.docs.forEach((document) {
    HocBong hocBong = HocBong.fromMap(document.data());
    itemsList.add(hocBong);
  });

  hocBongNotifier.scholarshipList = itemsList;
}
