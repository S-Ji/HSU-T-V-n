import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutterhoasen/model/DangKy.dart';
import 'package:flutterhoasen/notifiel/DangKyNotifiel.dart';

getRegisList(DangKyNotifier dangKyNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('forms').get();

  List<DangKy> itemsList = [];

  snapshot.docs.forEach((document) {
    DangKy dangKy = DangKy.fromMap(document.data());
    itemsList.add(dangKy);
  });

  dangKyNotifier.regisList = itemsList;
}

uploadRegis(DangKy dangKy, Function regisUploaded) async {
  _uploadRegis(dangKy, regisUploaded);
}

_uploadRegis(DangKy dangKy, Function regisUploaded) async {
  CollectionReference regisRef = FirebaseFirestore.instance.collection('forms');

  dangKy.createdAt = Timestamp.now();

  DocumentReference documentRef = await regisRef.add(dangKy.toMap());

  dangKy.id = documentRef.id;

  print('uploaded dang ky successfully: ${dangKy.toString()}');

  await documentRef.set(dangKy.toMap());

  regisUploaded(dangKy);
}

deleteRegis(DangKy dangKy, Function deleteRegis) async {
  CollectionReference regisRef = FirebaseFirestore.instance.collection('forms');
  DocumentReference documentRef = await regisRef.add(dangKy.toMap());

  dangKy.id = documentRef.id;
  await documentRef.set(dangKy.toMap());
  await FirebaseFirestore.instance.collection('forms').doc(dangKy.id).delete();
  deleteRegis(dangKy);
}
