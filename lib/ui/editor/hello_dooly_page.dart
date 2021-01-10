import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';


class HelloDoolyEditorPage extends StatefulWidget {
  HelloDoolyEditorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HelloDoolyEditorPage> {
  TextEditingController _textEditingController = TextEditingController(text: "");
  TextEditingController _text2EditingController = TextEditingController(text: "");
  String _firstText = "";
  String _secondText = "";
  double _fontSize = 14.0;
  double _doolyFontSize = 14.0;
  var globalKey = new GlobalKey();

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
                child: RepaintBoundary(
                  key: globalKey,
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
                          child: Center(
                            child: Text(
                              _firstText,
                              style: TextStyle(fontSize: _fontSize, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
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
                          child: Center(
                            child: Text(
                              _secondText,
                              style:
                              TextStyle(fontSize: _doolyFontSize, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
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
                    onPressed: () {
                      _capture();
                    },
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

  void _capture() async {
    print("START CAPTURE");
    var renderObject = globalKey.currentContext.findRenderObject();
    if (renderObject is RenderRepaintBoundary) {
      var boundary = renderObject;
      ui.Image image = await boundary.toImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      print(directory);
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      print(pngBytes);
      File imgFile = new File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);
      print("FINISH CAPTURE ${imgFile.path}");
    } else {
      print("!");
    }
  }
}