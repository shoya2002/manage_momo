import 'task_manager.dart';
import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller; // nullable を削除し late を使用
  late Animation<Color?> animation; // nullable を削除し late を使用
  String? ID;
  String? password;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 6),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'もも管',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent.shade200,
      ),
      backgroundColor: Color(0xFFFFE1E6),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'もも太郎の管理アプリ',
                  style: TextStyle(
                    color: Colors.pink.shade300,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Hero(
                  tag: 'momo',
                  child: Container(
                    child: Image.asset('images/momo.png'),
                    height: 120.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                ID = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
                fillColor: Colors.white, // 入力フィールドの背景色を白に設定
                filled: true, // 入力フィールドの背景色を有効にする
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password',
                fillColor: Colors.white, // 入力フィールドの背景色を白に設定
                filled: true, // 入力フィールドの背景色を有効にする
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            RoundedButton(
              title: 'Next',
              colour: Colors.pink.shade300,
              onPressed: () {
                Navigator.pushNamed(context, TaskManager.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
