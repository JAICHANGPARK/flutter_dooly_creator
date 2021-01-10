import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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

class _MainPageState extends State<MainPage> {
  final List<String> listImages = [
    'assets/img/welcome.png',
    'assets/img/damage.png',
    'assets/img/want_bob.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView(
            physics: BouncingScrollPhysics(),
            children: [
              InkWell(
                child: Image.asset(
                  listImages[0],
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: "어이 둘리",
                          )));
                },
              ),
              Image.asset(
                listImages[1],
                fit: BoxFit.cover,
              ),
              Image.asset(
                listImages[2],
                fit: BoxFit.cover,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController(text: "");
  TextEditingController _text2EditingController = TextEditingController(text: "");
  String _firstText = "";
  String _secondText = "";
  double _fontSize = 14.0;
  double _doolyFontSize = 14.0;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _text2EditingController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      // resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        actions: [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0),
                child: Stack(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Image.asset(
                          "assets/img/welcome.png",
                          fit: BoxFit.fitHeight,
                        )),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                      ),
                      height: 36,
                      width: 108,
                      left: 54,
                      top: 24,
                    ),
                    Positioned(
                      child: Container(
                        child: Text(
                          _firstText,
                          style: TextStyle(fontSize: _fontSize, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: 36,
                      width: 108,
                      left: 54,
                      top: 24,
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                      ),
                      height: 64,
                      width: 132,
                      right: 44,
                      top: 50,
                    ),
                    Positioned(
                      child: Container(
                        child: Text(
                          _secondText,
                          style: TextStyle(fontSize: _doolyFontSize, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: 64,
                      width: 132,
                      right: 44,
                      top: 50,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "도우너:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      flex: 10,
                      child: TextField(
                        maxLines: 1,
                        controller: _textEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _textEditingController.clear();
                                  _firstText = "";
                                });
                              },
                            )),
                        onChanged: (value) {
                          setState(() {
                            _firstText = value;
                          });
                        },
                        onSubmitted: (value) {
                          setState(() {
                            _firstText = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Row(
                  children: [
                    Text(
                      "글자크기",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Spacer(),
                    ButtonBar(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _fontSize = 14.0;
                              });
                            },
                            child: Text(
                              "초기화",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _fontSize -= 1.0;
                              });
                            },
                            child: Text(
                              "작게",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _fontSize += 1.0;
                              });
                            },
                            child: Text(
                              "크게",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "둘리:",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      flex: 10,
                      child: TextField(
                        maxLines: 1,
                        controller: _text2EditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _text2EditingController.clear();
                                  _secondText = "";
                                });
                              },
                            )),
                        onChanged: (value) {
                          setState(() {
                            _secondText = value;
                          });
                        },
                        onSubmitted: (value) {
                          setState(() {
                            _secondText = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Row(
                  children: [
                    Text(
                      "글자크기",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Spacer(),
                    ButtonBar(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _doolyFontSize = 14.0;
                              });
                            },
                            child: Text(
                              "초기화",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _doolyFontSize -= 1.0;
                              });
                            },
                            child: Text(
                              "작게",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _doolyFontSize += 1.0;
                              });
                            },
                            child: Text(
                              "크게",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 64,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _text2EditingController.clear();
                        _textEditingController.clear();
                        _fontSize = 14.0;
                        _doolyFontSize = 14.0;
                        _secondText = "";
                        _firstText = "";
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "전체 초기화",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    elevation: 4,
                    onPressed: () {},
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: Colors.yellow,
                    height: 48,
                    child: Text(
                      "저장하기",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
