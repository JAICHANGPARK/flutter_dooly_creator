import 'package:flutter/material.dart';
import 'package:flutter_dooly_creator/ui/app_info_page.dart';
import 'package:flutter_dooly_creator/ui/editor/line_out_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'editor/becare_well_page.dart';
import 'editor/damage_page.dart';
import 'editor/hello_dooly_page.dart';
import 'editor/want_bob_page.dart';

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
    'assets/img/becare.png',
    'assets/img/line.png',
    'assets/img/lol.png',
    'assets/img/beam.png',
    'assets/img/time_cosmos.png',

  ];

  Future getPermission() async {
    var status = await Permission.storage.status;
    // await Permission.location.request();
    if (status.isUndetermined) {
      // We didn't ask for permission yet.
      await Permission.storage.request();
      // await Permission.location.request();
    }

// You can can also directly ask the permission about its status.
    if (await Permission.storage.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      await Permission.storage.request();
      // await Permission.location.request();
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
              title: Text("도움말"),
              leading: Icon(Icons.info_outline),
              subtitle: Text("애플리케이션 정보"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AppInfoPage()));
              },
            ),

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
                            builder: (context) => MagicDoolyEditorPage(
                                  title: "초능력 맛 좀 볼래?",
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
                            builder: (context) => WantBobDoolyEditorPage(
                                  title: "밥줘",
                                )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Image.asset(
                            listImages[3],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BecareWellDoolyEditorPage(
                              title: "처신잘하라고",
                            )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Image.asset(
                            listImages[4],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LineOutDoolyEditorPage(
                              title: "선넘네 ...",
                            )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Image.asset(
                            listImages[5],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WantBobDoolyEditorPage(
                              title: "처신잘하라고",
                            )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Image.asset(
                            listImages[6],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WantBobDoolyEditorPage(
                              title: "처신잘하라고",
                            )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Image.asset(
                            listImages[7],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WantBobDoolyEditorPage(
                              title: "처신잘하라고",
                            )));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 8,
                    effect: WormEffect(dotColor: Colors.grey, activeDotColor: Colors.red), // your preferred effect
                    onDotClicked: (index) {
                      _pageController.animateToPage(index, duration: Duration(milliseconds: 250), curve: Curves.easeIn);
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
