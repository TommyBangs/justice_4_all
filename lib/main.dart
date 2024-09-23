import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:justice_4_all/modules/login/Welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Justice 4 All',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF002341),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFC0C0C0),
          foregroundColor: Colors.black,
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
