import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic App',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: TempPage(),
    );
    // return MaterialApp(
    //   title: '둘리 짤 생성기',
    //   darkTheme: ThemeData.dark(),
    //   theme: ThemeData.light().copyWith(primaryColor: Colors.red),
    //   home: MyHomePage(title: '둘리 짤 생성기'),
    // );
  }
}

class TempPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
      drawer: Drawer(),
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
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.asset("assets/img/welcome.png"),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                      ),
                      height: 32,
                      width: 110,
                      left: 64,
                      top: 32,
                    ),
                    Positioned(
                      child: Container(
                        child: Text(
                          _firstText,
                          style: TextStyle(
                            fontSize: _fontSize,
                          ),
                        ),
                      ),
                      height: 32,
                      width: 110,
                      left: 64,
                      top: 32,
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                      ),
                      height: 32,
                      width: 120,
                      right: 64,
                      top: 64,
                    ),
                    Positioned(
                      child: Container(
                        child: Text(
                          _secondText,
                          style: TextStyle(
                            fontSize: _doolyFontSize,
                          ),
                        ),
                      ),
                      height: 64,
                      width: 132,
                      right: 48,
                      top: 50,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "글자크기",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Spacer(),
                    ButtonBar(
                      buttonPadding: EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _fontSize = 14.0;
                              });
                            },
                            child: Text(
                              "초기화",
                              style: TextStyle(fontSize: 18),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _fontSize -= 1.0;
                              });
                            },
                            child: Text(
                              "작게",
                              style: TextStyle(fontSize: 18),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _fontSize += 1.0;
                              });
                            },
                            child: Text(
                              "크게",
                              style: TextStyle(fontSize: 18),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "글자크기",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Spacer(),
                    ButtonBar(
                      buttonPadding: EdgeInsets.symmetric(horizontal: 8),
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _doolyFontSize = 14.0;
                              });
                            },
                            child: Text(
                              "초기화",
                              style: TextStyle(fontSize: 18),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _doolyFontSize -= 1.0;
                              });
                            },
                            child: Text(
                              "작게",
                              style: TextStyle(fontSize: 18),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _doolyFontSize += 1.0;
                              });
                            },
                            child: Text(
                              "크게",
                              style: TextStyle(fontSize: 18),
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
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    elevation: 4,
                    onPressed: () {},
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: Colors.black,
                    height: 48,
                    child: Text(
                      "저장하기",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
