import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'formDangKy.dart';
import 'thongtin_page.dart';
import 'dangky_page.dart';
import 'nganhnghe_page.dart';
import 'hocbong_page.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

User loggedInUser;

class NavigationPage extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

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

  PageController _pageController = PageController();
  List<Widget> _screen = [
    ThongTinPage(),
    FormDangKyPage(),
    NganhNghePage(),
    HocBongPage(),
    ChatScreen()
  ];

  int _selectedIndex = 0;

  void onPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItem(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: onPage,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItem,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.newspaper,
              color:
                  _selectedIndex == 0 ? Colors.lightBlueAccent : Colors.white,
            ),
            label: 'Thông tin',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.pencilAlt,
                color:
                    _selectedIndex == 1 ? Colors.lightBlueAccent : Colors.white,
              ),
              label: 'Đăng ký'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.book,
                color:
                    _selectedIndex == 2 ? Colors.lightBlueAccent : Colors.white,
              ),
              label: 'Ngành nghề'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.trophy,
                color:
                    _selectedIndex == 3 ? Colors.lightBlueAccent : Colors.white,
              ),
              label: 'Học bổng'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.comment,
                color:
                    _selectedIndex == 4 ? Colors.lightBlueAccent : Colors.white,
              ),
              label: 'Chat'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlueAccent,
      ),
    );
  }
}
