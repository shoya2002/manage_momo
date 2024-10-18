import 'setting_screen.dart';
import 'friend_screen.dart';
import 'login.dart';
import 'register.dart';
import 'task_manager.dart';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'complete_task.dart';
import 'event_screen.dart';

void main() {
  runApp(Flash_chat());
}

class Flash_chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        TaskManager.id: (context) => TaskManager(),
        SettingsScreen.id: (context) => SettingsScreen(),
        FriendScreen.id: (context) => FriendScreen(),
        CompletedTasksScreen.id: (context) => CompletedTasksScreen(),
        EventScreen.id: (context) => EventScreen()
      },
    );
  }
}
