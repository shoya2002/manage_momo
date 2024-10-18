import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'constants.dart';
import 'task_manager.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? gender;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? id;
  String? password;
  String? username;

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                '個人情報登録',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        gender = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: '性'),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        lastName = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: '名'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'e-mail'),
              ),
              SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  phone = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: '携帯電話'),
              ),
              SizedBox(height: 20.0),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  id = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'ID'),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
              ),
              SizedBox(height: 20.0),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  username = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'ユーザー名'),
              ),
              SizedBox(height: 150.0),
              Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: 'kiji',
                  child: Container(
                    child: Image.asset('images/kiji.png'),
                    height: 70.0,
                  ),
                ),
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.pink.shade300,
                onPressed: () {
                  Navigator.pushNamed(context, TaskManager.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
