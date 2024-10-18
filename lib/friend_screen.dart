import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {
  static const String id = 'friend_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'フレンド一覧',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade200,
      ),
      backgroundColor: Color(0xFFFFE1E6),
      body: ListView(
        children: [
          ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            title: Text('Hiroki'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/momo2.png',
                      height: 20.0,
                    ),
                    Text('Lv. 10'),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            title: Text('Towa'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/momo.png',
                      height: 20.0,
                    ),
                    Text('Lv. 20'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
