import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dooly_creator/firebase_options.dart';
import 'package:flutter_dooly_creator/res/app_string.dart';
import 'package:flutter_dooly_creator/ui/dooly_main_page.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.red[500],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[500],
        ),
      ),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.red[500],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[500],
        ),
      ),
      home: MainPage(),
    );
  }
}
