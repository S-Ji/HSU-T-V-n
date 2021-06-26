import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhoasen/components/rounded_button.dart';
import 'package:flutterhoasen/notifiel/DangKyNotifiel.dart';
import 'package:provider/provider.dart';
import 'package:flutterhoasen/model/DangKy.dart';
import 'package:audioplayers/audioplayers.dart';

final _firestore = FirebaseFirestore.instance;

class RegisDetailPage extends StatelessWidget {
  AudioCache audioCache = AudioCache();
  @override
  Widget build(BuildContext context) {
    DangKyNotifier dangKyNotifier = Provider.of<DangKyNotifier>(context);

    _onRegisDeleted(DangKy dangKy) {
      Navigator.pop(context);
      dangKyNotifier.deleteRegis(dangKy);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '${dangKyNotifier.currentRegis.name}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Đăng ký: ${dangKyNotifier.currentRegis.dangky}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Số điện thoại: ${dangKyNotifier.currentRegis.sdt}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Địa chỉ: ${dangKyNotifier.currentRegis.diachi}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RoundedButton(
                        title: 'Xóa',
                        colour: Color(0xFFEB1555),
                        onPressed: () {
                          // deleteRegis(dangKyNotifier.currentRegis, _onRegisDeleted);
                          _firestore
                              .collection('forms')
                              .where("name",
                                  isEqualTo: dangKyNotifier.currentRegis.name)
                              .where("dangky",
                                  isEqualTo: dangKyNotifier.currentRegis.dangky)
                              .where("sdt",
                                  isEqualTo: dangKyNotifier.currentRegis.sdt)
                              .where("diachi",
                                  isEqualTo: dangKyNotifier.currentRegis.diachi)
                              .get()
                              .then((value) {
                            value.docs.forEach((element) {
                              FirebaseFirestore.instance
                                  .collection("forms")
                                  .doc(element.id)
                                  .delete()
                                  .then((value) {
                                print("${element.id}");
                              });
                            });
                          });
                          audioCache.load('wrong.mp3');
                          audioCache.play('wrong.mp3');
                          Navigator.pop(context);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
