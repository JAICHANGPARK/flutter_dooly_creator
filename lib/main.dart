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
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.red
      ),
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
  int _counter = 0;
  TextEditingController _textEditingController = TextEditingController(text: "");

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
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
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        
                      ),
                    ),
                  ),
                  height: 32,
                  width: 110,
                  left: 64,
                  top: 32,
                )
              ],
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
