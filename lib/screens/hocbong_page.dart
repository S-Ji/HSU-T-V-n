import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterhoasen/notifiel/HocBongNotifiel.dart';
import 'package:flutterhoasen/api/HocBong_api.dart';
import 'package:flutterhoasen/screens/scholarshipDetail.dart';

class HocBongPage extends StatefulWidget {
  @override
  _HocBongPageState createState() => _HocBongPageState();
}

class _HocBongPageState extends State<HocBongPage> {
  @override
  void initState() {
    // TODO: implement initState
    HocBongNotifier hocBongNotifier =
        Provider.of<HocBongNotifier>(context, listen: false);
    getScholarshipList(hocBongNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HocBongNotifier hocBongNotifier = Provider.of<HocBongNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Học bổng'),
        ),
        body: ListView.builder(
            itemCount: hocBongNotifier.scholarshipList.length,
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
                        hocBongNotifier.scholarshipList[index].image != null
                            ? hocBongNotifier.scholarshipList[index].image
                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                      ),
                      child: InkWell(
                        onTap: () {
                          hocBongNotifier.currentScholarship =
                              hocBongNotifier.scholarshipList[index];
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return ScholarshipDetailPage();
                            }),
                          );
                        },
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
                          hocBongNotifier.scholarshipList[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24,
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
