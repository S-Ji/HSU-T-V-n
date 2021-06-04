import 'package:flutter/material.dart';
import 'package:flutterhoasen/components/rounded_button.dart';
import 'package:flutterhoasen/model/DangKy.dart';
import 'package:flutterhoasen/notifiel/DangKyNotifiel.dart';
import 'package:flutterhoasen/screens/regisDetail.dart';
import 'package:provider/provider.dart';
import 'package:flutterhoasen/api/DangKy_api.dart';
import 'formDangKy.dart';

import '../constants.dart';

class DangKyPage extends StatefulWidget {
  static const String id = 'dangKyPage_screen';
  @override
  _DangKyPageState createState() => _DangKyPageState();
}

class _DangKyPageState extends State<DangKyPage> {
  @override
  void initState() {
    // TODO: implement initState
    DangKyNotifier dangKyNotifier =
        Provider.of<DangKyNotifier>(context, listen: false);
    getRegisList(dangKyNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DangKyNotifier dangKyNotifier = Provider.of<DangKyNotifier>(context);
    Future<void> _refreshList() async {
      getRegisList(dangKyNotifier);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký tuyển sinh'),
      ),
      body: new RefreshIndicator(
        child: ListView.builder(
            itemCount: dangKyNotifier.regisList.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Đăng ký: ${dangKyNotifier.regisList[index].dangky}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Họ tên: ${dangKyNotifier.regisList[index].name}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RoundedButton(
                            title: 'Chi tiết',
                            colour: Colors.blueAccent,
                            onPressed: () {
                              dangKyNotifier.currentRegis =
                                  dangKyNotifier.regisList[index];

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return RegisDetailPage();
                                }),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            }),
        onRefresh: _refreshList,
      ),
    );
  }
}
