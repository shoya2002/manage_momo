import 'package:flutter/material.dart';
import 'task_manager.dart';

class CompletedTasksScreen extends StatelessWidget {
  static const String id = 'completed_tasks_screen';

  @override
  Widget build(BuildContext context) {
    int _level = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '期間終了タスク一覧',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade200,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFFFFE1E6),
      body: Stack(
        children: [
          Positioned(
            left: 16.0,
            bottom: 16.0,
            child: Column(
              children: [
                Image.asset(
                  'images/momo2.png',
                  height: 50.0,
                ),
                Text(
                  'Lv. $_level',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
