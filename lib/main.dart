import 'package:flutter/material.dart';

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
      theme: ThemeData.light().copyWith(primaryColor: Colors.red),
      home: MyHomePage(title: '둘리 짤 생성기'),
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
          style: TextStyle(),
        ),
      ),
      body: SingleChildScrollView(
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
                      child: Text(_firstText),
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
                      child: Text(_secondText),
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
                    child: Text("도우너:"),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 10,
                    child: TextField(
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
                  Expanded(
                    child: Text("둘리:"),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 10,
                    child: TextField(
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
              child: MaterialButton(
                elevation: 4,
                onPressed: () {},
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                color: Theme.of(context).cardColor,
                height: 48,
                child: Text(
                  "저장하기",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
