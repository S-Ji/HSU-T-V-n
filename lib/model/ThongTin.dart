import 'package:cloud_firestore/cloud_firestore.dart';

class ThongTin {
  String id;
  String name;
  String image;
  String url;
  Timestamp createdAt;

  ThongTin.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
    url = data['url'];
    createdAt = data['createdAt'];
  }
}
