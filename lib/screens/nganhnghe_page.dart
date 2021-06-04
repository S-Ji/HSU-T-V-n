import 'package:flutter/material.dart';
import 'careerDetail.dart';
import 'package:flutterhoasen/notifiel/NganhNgheNotifiel.dart';
import 'package:provider/provider.dart';
import 'package:flutterhoasen/api/NganhNghe_api.dart';

// final infoList = FirebaseFirestore.instance.collection('major');

class NganhNghePage extends StatefulWidget {
  @override
  _NganhNghePageState createState() => _NganhNghePageState();
}

class _NganhNghePageState extends State<NganhNghePage> {
  @override
  void initState() {
    // TODO: implement initState
    NganhNgheNotifier nganhNgheNotifier =
        Provider.of<NganhNgheNotifier>(context, listen: false);
    getCareerList(nganhNgheNotifier);
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    NganhNgheNotifier nganhNgheNotifier =
        Provider.of<NganhNgheNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Ngành nghề tuyển sinh'),
        ),
        body: ListView.builder(
            itemCount: nganhNgheNotifier.careerList.length,
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
                        nganhNgheNotifier.careerList[index].image != null
                            ? nganhNgheNotifier.careerList[index].image
                            : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                      ),
                      child: InkWell(
                        onTap: () {
                          nganhNgheNotifier.currentCareer =
                              nganhNgheNotifier.careerList[index];
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return CareerDetailPage();
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
                          nganhNgheNotifier.careerList[index].name,
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
