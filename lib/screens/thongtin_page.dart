import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterhoasen/notifiel/ThongTinNotifiel.dart';
import 'package:provider/provider.dart';
import 'package:flutterhoasen/api/ThongTin_api.dart';

class ThongTinPage extends StatefulWidget {
  @override
  _ThongTinPageState createState() => _ThongTinPageState();
}

class _ThongTinPageState extends State<ThongTinPage> {
  @override
  void initState() {
    // TODO: implement initState
    ThongTinNotifier thongTinNotifier =
        Provider.of<ThongTinNotifier>(context, listen: false);
    getInfoList(thongTinNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThongTinNotifier thongTinNotifier = Provider.of<ThongTinNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Thông tin tuyển sinh'),
        ),
        body: ListView.builder(
            itemCount: thongTinNotifier.infoList.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Ink.image(
                      image: NetworkImage(
                        thongTinNotifier.infoList[index].image != null
                            ? thongTinNotifier.infoList[index].image
                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                      ),
                      child: InkWell(
                        onTap: () => launch(
                          thongTinNotifier.infoList[index].url,
                          forceSafariVC: true,
                          forceWebView: true,
                        ),
                      ),
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Container(
                        width: double.maxFinite,
                        height: 50,
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          thongTinNotifier.infoList[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
