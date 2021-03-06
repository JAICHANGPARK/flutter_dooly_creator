import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dooly_creator/res/app_string.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'ui/dooly_main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light().copyWith(primaryColor: Colors.red[500]),
      home: MainPage(),
    );
  }
}
