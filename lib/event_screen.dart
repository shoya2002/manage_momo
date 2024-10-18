import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  static const String id = 'event_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '桃太郎 VS 鬼',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade200,
      ),
      backgroundColor: Color(0xFFFFE1E6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/battle.png', // 鬼と戦うアニメーションの画像
              height: .0,
            ),
          ],
        ),
      ),
    );
  }
}
