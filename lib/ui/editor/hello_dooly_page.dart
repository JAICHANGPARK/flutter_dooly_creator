import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
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
                  child: SizedBox(
                    height: 360,
                    width: 360,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            "assets/img/welcome.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            color: Colors.white,
                          ),
                          height: 38,
                          width: 92,
                          left: 72,
                          top: 20,
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
                          height: 38,
                          width: 92,
                          left: 72,
                          top: 20,
                        ),
                        Positioned(
                          child: Container(
                            color: Colors.white,
                          ),
                          height: 58,
                          width: 124,
                          right: 52,
                          top: 46,
                        ),
                        Positioned(
                          child: Container(
                            child: Center(
                              child: Text(
                                _secondText,
                                style: TextStyle(
                                    fontSize: _doolyFontSize, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          height: 58,
                          width: 124,
                          right: 52,
                          top: 46,
                        ),
                      ],
                    ),
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
                    onPressed: () async {
                      // _capture();
                      Uint8List imgData = await getWidgetBytes();
                      if (imgData != null) {
                        print(imgData);
                        await showDialog(
                            builder: (context) => AlertDialog(
                                  contentPadding: EdgeInsets.all(8),
                                  title: Text("결과"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.memory(imgData),
                                      MaterialButton(
                                        onPressed: () async {
                                          bool result = await _saveFile(imgData);
                                          if (result) Navigator.of(context).pop();
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.save_alt_outlined),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text("저장하기"),
                                          ],
                                        ),
                                        minWidth: double.infinity,
                                        height: 36,
                                        color: Colors.green[300],
                                      ),
                                      OutlinedButton(
                                        onPressed: () async {
                                          _shareImageFile(imgData, "hello_dooly");
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.share_outlined),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text("공유하기"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            context: context);
                      }
                    },
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: Colors.yellow,
                    height: 48,
                    child: Text(
                      "완료",
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

  Future<Uint8List> getWidgetBytes() async {
    var renderObject = globalKey.currentContext.findRenderObject();
    if (renderObject is RenderRepaintBoundary) {
      var boundary = renderObject;
      ui.Image image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      return pngBytes;
    }
    return null;
  }

  void _shareImageFile(
    Uint8List data,
    String name,
  ) async {
    try {
      await Share.file('둘리짤생성기', '${name}_${DateFormat("hh:mm:ss").format(DateTime.now())}.png', data, 'image/png',
          text: '');
    } catch (e) {
      Fluttertoast.showToast(msg: 'error: $e');
    }
  }

  Future<bool> _saveFile(Uint8List data) async {
    String datetime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    final directory = (await getApplicationDocumentsDirectory()).path;
    File imgFile = new File('$directory/screenshot_${datetime}.png');
    try {
      imgFile.writeAsBytes(data);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
    try {
      final result = await ImageGallerySaver.saveImage(data, quality: 100, name: "dooly_hello_$datetime");
      if (result['isSuccess'] == true) {
        Fluttertoast.showToast(msg: "저장 성공");
      } else {
        Fluttertoast.showToast(msg: "저장 실패");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
    return true;
  }

  void _capture() async {
    print("START CAPTURE");
    String datetime = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
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
      try {
        imgFile.writeAsBytes(pngBytes);
        print("FINISH CAPTURE ${imgFile.path}");
      } catch (e) {
        print(e);
      }
      try {
        final result = await ImageGallerySaver.saveImage(pngBytes, quality: 100, name: "dooly_hello_$datetime");
        if (result['isSuccess'] == true) {
          Fluttertoast.showToast(msg: "저장 성공");
        } else {
          Fluttertoast.showToast(msg: "저장 실패");
        }
        print(result);
      } catch (e) {
        print(e);
      }
    } else {
      print("!");
    }
  }
}
