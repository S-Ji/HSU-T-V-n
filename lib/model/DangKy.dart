import 'package:cloud_firestore/cloud_firestore.dart';

class DangKy {
  String id;
  String name;
  String sdt;
  String diachi;
  String dangky;
  Timestamp createdAt;
  Timestamp updatedAt;
  DangKy();
  DangKy.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    diachi = data['diachi'];
    dangky = data['dangky'];
    sdt = data['sdt'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'diachi': diachi,
      'dangky': dangky,
      'sdt': sdt,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
