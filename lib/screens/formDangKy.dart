import 'package:flutter/material.dart';
import 'package:flutterhoasen/components/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhoasen/model/DangKy.dart';
import '../constants.dart';
import 'package:flutterhoasen/screens/dangky_page.dart';
import 'package:flutterhoasen/api/DangKy_api.dart';
import 'package:flutterhoasen/notifiel/DangKyNotifiel.dart';
import 'package:provider/provider.dart';

final _firestore = FirebaseFirestore.instance;

class FormDangKyPage extends StatefulWidget {
  static const String id = 'formDangKyPage_screen';
  @override
  _FormDangKyPageState createState() => _FormDangKyPageState();
}

class _FormDangKyPageState extends State<FormDangKyPage> {
  final nameTextController = TextEditingController();
  final diachiTextController = TextEditingController();
  final sdtTextController = TextEditingController();
  final dangkyTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DangKy _currentRegis;
  String name;
  String diachi;
  String sdt;
  String dangky;

  @override
  void initState() {
    DangKyNotifier dangKyNotifier =
        Provider.of<DangKyNotifier>(context, listen: false);

    if (dangKyNotifier.currentRegis != null) {
      _currentRegis = dangKyNotifier.currentRegis;
    } else {
      _currentRegis = DangKy();
    }
    super.initState();
  }
  //
  // _onFoodUploaded(DangKy dangKy) {
  //   DangKyNotifier dangKyNotifier =
  //       Provider.of<DangKyNotifier>(context, listen: false);
  //   dangKyNotifier.addRegis(dangKy);
  //   Navigator.pop(context);
  // }
  //
  // _saveRegis() {
  //   uploadRegis(_currentRegis, _onFoodUploaded);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: nameTextController,
                textAlign: TextAlign.center,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Nhập họ tên';
                  }

                  return null;
                },
                onChanged: (value) {
                  name = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Họ tên'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Nhập địa chỉ';
                    }

                    return null;
                  },
                  controller: diachiTextController,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    diachi = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Địa chỉ')),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Nhập số điện thoại';
                    }

                    return null;
                  },
                  controller: sdtTextController,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    sdt = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Số điện thoại')),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Nhập ngành đăng ký';
                    }

                    return null;
                  },
                  controller: dangkyTextController,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    dangky = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Ngành đăng ký')),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Xác nhận',
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  } else {
                    nameTextController.clear();
                    diachiTextController.clear();
                    sdtTextController.clear();
                    dangkyTextController.clear();
                    _firestore.collection('forms').add({
                      'name': name,
                      'diachi': diachi,
                      'sdt': sdt,
                      'dangky': dangky,
                      'created_at': FieldValue.serverTimestamp(),
                    });
                    // _saveRegis();
                    Navigator.pushNamed(context, DangKyPage.id);
                  }
                },
              ),
              RoundedButton(
                title: 'Danh sách đăng ký',
                colour: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, DangKyPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}