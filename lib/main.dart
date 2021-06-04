import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterhoasen/screens/navigator.dart';
import 'package:flutterhoasen/screens/welcome_screen.dart';
import 'package:flutterhoasen/screens/login_screen.dart';
import 'package:flutterhoasen/screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutterhoasen/notifiel/NganhNgheNotifiel.dart';
import 'package:flutterhoasen/notifiel/HocBongNotifiel.dart';
import 'package:flutterhoasen/notifiel/ThongTinNotifiel.dart';
import 'package:flutterhoasen/notifiel/DangKyNotifiel.dart';
import 'screens/formDangKy.dart';
import 'screens/dangky_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NganhNgheNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => HocBongNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThongTinNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => DangKyNotifier(),
      )
    ],
    child: HoaSenTuVan(),
  ));
}

class HoaSenTuVan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        NavigationPage.id: (context) => NavigationPage(),
        FormDangKyPage.id: (context) => FormDangKyPage(),
        DangKyPage.id: (context) => DangKyPage(),
      },
    );
  }
}
