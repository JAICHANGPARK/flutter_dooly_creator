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
              title: Text("원화"),
              subtitle: Text("애기공룡 둘리 @엉덩국"),
            ),
            Divider(height: 4,),
            ListTile(
              title: Text("개발자"),
              subtitle: Text("박제창 (@Dreamwalker)"),
            ),
            Divider(height: 4,),
            ListTile(
              title: Text("버전"),
              subtitle: Text("1.2.2"),
            ),
            Divider(height: 4,),
            ListTile(
              title: Text("오픈소스라이선스"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LicensePage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
