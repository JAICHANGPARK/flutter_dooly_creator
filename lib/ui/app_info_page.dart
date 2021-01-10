import 'package:flutter/material.dart';


class AppInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("도움말"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text("원작"),
              subtitle: Text("애기공룡 둘리 @엉덩국"),
            ),
            ListTile(
              title: Text("개발"),
              subtitle: Text("박제창(@Dreamwalker)"),
            ),
            ListTile(
              title: Text("버전"),
              subtitle: Text("1.0.1"),
            )
          ],
        ),
      ),
    );
  }
}
