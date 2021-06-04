import 'package:cloud_firestore/cloud_firestore.dart';

class HocBong {
  String id;
  String name;
  String tongsosuat;
  String detail;
  String image;
  List loai1 = [];
  List loai2 = [];
  List loai3 = [];
  List loai100 = [];
  List loai75 = [];
  List loai50 = [];
  List loai25 = [];
  Timestamp createdAt;

  HocBong.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    tongsosuat = data['tongsosuat'];
    detail = data['detail'];
    image = data['image'];
    loai1 = data['loai1'];
    loai2 = data['loai2'];
    loai3 = data['loai3'];
    loai100 = data['loai100'];
    loai75 = data['loai75'];
    loai50 = data['loai50'];
    loai25 = data['loai25'];
    createdAt = data['createdAt'];
  }
}
