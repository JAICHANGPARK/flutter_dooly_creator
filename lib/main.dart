
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'ui/dooly_main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '둘리 짤 생성기',
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light().copyWith(primaryColor: Colors.red[500]),
      // home: MyHomePage(title: '둘리 짤 생성기'),
      home: MainPage(),
    );
  }
}



