import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:ui' as ui;

import 'ui/editor/hello_dooly_page.dart';

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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  PageController _pageController;

  final List<String> listImages = [
    'assets/img/welcome.png',
    'assets/img/damage.png',
    'assets/img/want_bob.png',
  ];
  Future getPermission()async{
    var status = await Permission.storage.status;
    if (status.isUndetermined) {
      // We didn't ask for permission yet.
      await Permission.storage.request();
    }

// You can can also directly ask the permission about its status.
    if (await Permission.storage.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      await Permission.storage.request();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.97);
    getPermission();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("둘리 짤 생성기"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("둘리 짤 생성기"),
              decoration: BoxDecoration(color: Colors.green[300]),
            ),
            ListTile(
              title: Text("원작"),
              subtitle: Text("애기공룡 둘리 @엉덩국"),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Expanded(
                flex: 15,
                child: PageView(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Image.asset(
                            listImages[0],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HelloDoolyEditorPage(
                                  title: "어이 둘리",
                                )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Image.asset(
                            listImages[1],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HelloDoolyEditorPage(
                                  title: "어이 둘리",
                                )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Image.asset(
                            listImages[2],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HelloDoolyEditorPage(
                                  title: "어이 둘리",
                                )));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: WormEffect(dotColor: Colors.grey, activeDotColor: Colors.red), // your preferred effect
                    onDotClicked: (index) {}),
              )
            ],
          ),
        )),
      ),
    );
  }
}

