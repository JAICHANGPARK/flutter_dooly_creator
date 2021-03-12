import 'package:flutter/material.dart';
import 'package:flutter_dooly_creator/res/app_string.dart';
import 'package:flutter_dooly_creator/ui/app_info_page.dart';
import 'package:flutter_dooly_creator/ui/editor/line_out_page.dart';
import 'package:flutter_dooly_creator/ui/editor/lol_dooly_page.dart';
import 'package:flutter_dooly_creator/ui/editor/sorder_gogildong_dooly_page.dart';
import 'package:flutter_dooly_creator/ui/editor/time_cosmos_dooly_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'editor/beam_page.dart';
import 'editor/becare_well_page.dart';
import 'editor/damage_page.dart';
import 'editor/hello_dooly_page.dart';
import 'editor/ice_star_dooly_page.dart';
import 'editor/want_bob_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  PageController _pageController;
  final InAppReview inAppReview = InAppReview.instance;

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

  AppUpdateInfo _updateInfo;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      // showSnack(e.toString());
      showSnack("업데이트 확인에 문제가 발생했다구!");
    });
  }
  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext)
          .showSnackBar(SnackBar(content: Text(text)));

      
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    getPermission();
    checkForUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(APP_TITLE),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                IMG_APP_ICON,
                height: 120,
                width: 120,
              ),
            ),
            Divider(),
            ListTile(
              title: Text("도움말"),
              leading: Icon(Icons.info_outline),
              subtitle: Text("애플리케이션 정보"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppInfoPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("평가하기"),
              leading: Icon(Icons.star_half_outlined),
              onTap: () async {
                if (await inAppReview.isAvailable()) {
                  await inAppReview.openStoreListing();
                } else {
                  Fluttertoast.showToast(msg: "현재 이용할 수 없는 상태입니다.");
                }
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: PageView(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 4,
                          child: Image.asset(
                            IMG_WELCOME,
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
                          elevation: 4,
                          child: Image.asset(
                            IMG_DAMAGE,
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
                          elevation: 4,
                          child: Image.asset(
                            IMG_WANT_BOB,
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
                          elevation: 4,
                          child: Image.asset(
                            IMG_BECARE_WELL,
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
                          elevation: 4,
                          child: Image.asset(
                            IMG_LINE_OUT,
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
                          elevation: 4,
                          child: Image.asset(
                            IMG_LOL,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LOLDoolyEditorPage(
                                  title: "ㅋㅋㅋㅋ",
                                )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Image.asset(
                            IMG_BEAM,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BeamDoolyEditorPage(
                                  title: "호잇",
                                )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Text(
                                  "성능 확실하구만.",
                                  style: TextStyle(fontSize: 18),
                                ),
                                left: 16,
                                top: 16,
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Image.asset(
                                  IMG_EFFECT,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TimeCosmosDoolyEditorPage(
                                  title: "성능 확실하구만",
                                )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Text(
                                  "얼음별",
                                  style: TextStyle(fontSize: 18),
                                ),
                                left: 16,
                                top: 16,
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Image.asset(
                                  IMG_ICE_STAR,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => IceStarDoolyEditorPage(
                              title: "얼음별에 두고온거 아니었냐구",
                            )));
                      },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Text(
                                  "검성 고길동",
                                  style: TextStyle(fontSize: 18),
                                ),
                                left: 16,
                                top: 16,
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Image.asset(
                                  IMG_SORDER_GOGILDONG,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SorderGogildongDoolyEditorPage(
                              title: "검성 고길동",
                            )));
                      },
                    ),
                    
                  ],
                ),
              ),
              Expanded(
                child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 10,
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
