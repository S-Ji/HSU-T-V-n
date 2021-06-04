import 'package:flutter/material.dart';
import 'package:flutterhoasen/notifiel/HocBongNotifiel.dart';
import 'package:provider/provider.dart';

class ScholarshipDetailPage extends StatefulWidget {
  @override
  _ScholarshipDetailPageState createState() => _ScholarshipDetailPageState();
}

class _ScholarshipDetailPageState extends State<ScholarshipDetailPage> {
  List<Widget> emty = [];

  @override
  Widget build(BuildContext context) {
    HocBongNotifier hocBongNotifier = Provider.of<HocBongNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(hocBongNotifier.currentScholarship.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.network(
                  hocBongNotifier.currentScholarship.image != null
                      ? hocBongNotifier.currentScholarship.image
                      : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 24),
                Text(
                  hocBongNotifier.currentScholarship.name,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  hocBongNotifier.currentScholarship.tongsosuat,
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),
                SizedBox(height: 16),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: hocBongNotifier.currentScholarship.name ==
                          "Học bổng Tài năng"
                      ? hocBongNotifier.currentScholarship.loai100
                          .map<Widget>(
                            (loai100) => Card(
                              color: Color(0xffff6968),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    loai100,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()
                      : hocBongNotifier.currentScholarship.loai1
                          .map<Widget>(
                            (loai1) => Card(
                              color: Color(0xffff6968),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    loai1,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
                SizedBox(height: 16),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: hocBongNotifier.currentScholarship.name ==
                          "Học bổng Tài năng"
                      ? hocBongNotifier.currentScholarship.loai75
                          .map<Widget>(
                            (loai75) => Card(
                              color: Color(0xff7a54ff),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    loai75,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()
                      : hocBongNotifier.currentScholarship.loai2
                          .map<Widget>(
                            (loai2) => Card(
                              color: Color(0xff7a54ff),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    loai2,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
                SizedBox(height: 16),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: hocBongNotifier.currentScholarship.name ==
                          "Học bổng Tài năng"
                      ? hocBongNotifier.currentScholarship.loai50
                          .map<Widget>(
                            (loai50) => Card(
                              color: Color(0xffff8f61),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    loai50,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()
                      : hocBongNotifier.currentScholarship.loai3
                          .map<Widget>(
                            (loai3) => Card(
                              color: Color(0xffff8f61),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    loai3,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
                SizedBox(height: 16),
                GridView.count(
                  childAspectRatio: hocBongNotifier.currentScholarship.name ==
                          "Học bổng Tài năng"
                      ? 1
                      : 50 / 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  crossAxisCount: 2,
                  crossAxisSpacing: hocBongNotifier.currentScholarship.name ==
                          "Học bổng Tài năng"
                      ? 4
                      : 0,
                  mainAxisSpacing: hocBongNotifier.currentScholarship.name ==
                          "Học bổng Tài năng"
                      ? 4
                      : 0,
                  children: hocBongNotifier.currentScholarship.name ==
                          "Học bổng Tài năng"
                      ? hocBongNotifier.currentScholarship.loai25
                          .map<Widget>(
                            (loai25) => Card(
                              color: Color(0xff2ac3ff),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    loai25,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()
                      : emty.toList(),
                ),
                SizedBox(
                    height: hocBongNotifier.currentScholarship.name ==
                            "Học bổng Tài năng"
                        ? 16
                        : 0),
                Text(
                  'Chi tiết',
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    hocBongNotifier.currentScholarship.detail != null
                        ? hocBongNotifier.currentScholarship.detail
                        : 'default value',
                    style: TextStyle(fontSize: 18),
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
