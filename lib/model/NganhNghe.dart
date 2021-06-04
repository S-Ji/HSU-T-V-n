import 'package:cloud_firestore/cloud_firestore.dart';

class NganhNghe {
  String id;
  String name;
  String khoa;
  String career;
  String program;
  String image;
  List thongtin = [];
  Timestamp createdAt;

  NganhNghe.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    khoa = data['khoa'];
    career = data['career'];
    program = data['program'];
    image = data['image'];
    thongtin = data['thongtin'];
    createdAt = data['createdAt'];
  }
}
