import 'package:flutter/material.dart';
import 'package:flutterhoasen/notifiel/NganhNgheNotifiel.dart';
import 'package:provider/provider.dart';

// final CollectionReference infoList =
//     FirebaseFirestore.instance.collection('major');

class CareerDetailPage extends StatefulWidget {
  @override
  _CareerDetailPageState createState() => _CareerDetailPageState();
}

// getInfoList(ThongTinNotifier thongTinNotifier) async {
//   List<ThongTin> itemsList = [];
//
//   await infoList.get().then((querySnapshot) {
//     querySnapshot.docs.forEach((doc) {
//       ThongTin thongTin = ThongTin.fromMap(doc.data());
//       itemsList.add(thongTin);
//     });
//     thongTinNotifier.infoList = itemsList;
//   });
// }

class _CareerDetailPageState extends State<CareerDetailPage> {
  @override
  Widget build(BuildContext context) {
    NganhNgheNotifier nganhNgheNotifier =
        Provider.of<NganhNgheNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(nganhNgheNotifier.currentCareer.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.network(
                  nganhNgheNotifier.currentCareer.image != null
                      ? nganhNgheNotifier.currentCareer.image
                      : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 24),
                Text(
                  nganhNgheNotifier.currentCareer.name,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  nganhNgheNotifier.currentCareer.khoa,
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
                  children: nganhNgheNotifier.currentCareer.thongtin
                      .map(
                        (thongtin) => Card(
                          color: Color(0xFFEB1555),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                thongtin,
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
                Text(
                  'Chương trình đào tạo',
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    nganhNgheNotifier.currentCareer.program != null
                        ? nganhNgheNotifier.currentCareer.program
                        : 'default value',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Cơ hội nghề nghiệp',
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.underline),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    nganhNgheNotifier.currentCareer.career != null
                        ? nganhNgheNotifier.currentCareer.career
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
