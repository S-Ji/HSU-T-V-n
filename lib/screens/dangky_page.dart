import 'package:flutter/material.dart';
import 'package:flutterhoasen/components/rounded_button.dart';

import 'package:flutterhoasen/notifiel/DangKyNotifiel.dart';
import 'package:flutterhoasen/screens/regisDetail.dart';
import 'package:provider/provider.dart';
import 'package:flutterhoasen/api/DangKy_api.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class DangKyPage extends StatefulWidget {
  static const String id = 'dangKyPage_screen';
  @override
  _DangKyPageState createState() => _DangKyPageState();
}

class _DangKyPageState extends State<DangKyPage> {
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    DangKyNotifier dangKyNotifier =
        Provider.of<DangKyNotifier>(context, listen: false);
    getRegisList(dangKyNotifier);
    getCurrentUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool IsNotvisibility = false;
    bool IsvisibilityOther = true;
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
              return Visibility(
                visible:
                    loggedInUser.email == dangKyNotifier.regisList[index].sender
                        ? IsvisibilityOther
                        : IsNotvisibility,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: loggedInUser.email ==
                            dangKyNotifier.regisList[index].sender
                        ? EdgeInsets.all(16.0)
                        : EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          loggedInUser.email ==
                                  dangKyNotifier.regisList[index].sender
                              ? 'Đăng ký: ${dangKyNotifier.regisList[index].dangky}'
                              : 'Đăng ký: chưa đăng ký',
                          style: TextStyle(
                            fontSize: loggedInUser.email ==
                                    dangKyNotifier.regisList[index].sender
                                ? 16
                                : 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: loggedInUser.email ==
                                  dangKyNotifier.regisList[index].sender
                              ? 10
                              : 0,
                        ),
                        Padding(
                          padding: loggedInUser.email ==
                                  dangKyNotifier.regisList[index].sender
                              ? EdgeInsets.all(5.0)
                              : EdgeInsets.all(0.0),
                          child: Text(
                            loggedInUser.email ==
                                    dangKyNotifier.regisList[index].sender
                                ? 'Họ tên: ${dangKyNotifier.regisList[index].name}'
                                : 'Họ tên: chưa đăng ký',
                            style: TextStyle(
                                fontSize: loggedInUser.email ==
                                        dangKyNotifier.regisList[index].sender
                                    ? 16
                                    : 0),
                          ),
                        ),
                        SizedBox(
                          height: loggedInUser.email ==
                                  dangKyNotifier.regisList[index].sender
                              ? 10.0
                              : 0,
                        ),
                        SizedBox(
                          width: loggedInUser.email ==
                                  dangKyNotifier.regisList[index].sender
                              ? double.infinity
                              : 0,
                          child: RoundedButton(
                              title: loggedInUser.email ==
                                      dangKyNotifier.regisList[index].sender
                                  ? 'Chi tiết'
                                  : ' ',
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
                ),
              );
            }),
        onRefresh: _refreshList,
      ),
    );
  }
}
