import 'package:flutter/material.dart';
import 'constants.dart';
import 'complete_task.dart';
import 'friend_screen.dart';
import 'setting_screen.dart';
import 'event_screen.dart';

class Task {
  String title;
  DateTime dueDate;
  bool isCompleted;

  Task({required this.title, required this.dueDate, this.isCompleted = false});
}

class TaskManager extends StatefulWidget {
  static const String id = 'task_manager';

  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  int _level = 1;
  List<Task> _tasks = [];
  List<Task> _expiredTasks = [];

  void _addTask(String title, DateTime dueDate) {
    setState(() {
      _tasks.add(Task(title: title, dueDate: dueDate));
      _tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate)); // タスクを日付と時間で並べ替える
    });
    _checkForExpiredTasks();
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
      _updateLevel();
    });
  }

  void _updateLevel() {
    DateTime today = DateTime.now();
    List<Task> todayTasks = _tasks
        .where((task) =>
            task.dueDate.year == today.year &&
            task.dueDate.month == today.month &&
            task.dueDate.day == today.day)
        .toList();
    int completedTasks = todayTasks.where((task) => task.isCompleted).length;
    int incompleteTasks = todayTasks.length - completedTasks;

    setState(() {
      if (completedTasks == todayTasks.length) {
        _level++;
      } else {
        _level = (_level - incompleteTasks).clamp(0, double.infinity).toInt();
      }
    });
  }

  void _checkForExpiredTasks() {
    DateTime now = DateTime.now();
    List<Task> expired = _tasks
        .where((task) => task.dueDate.isBefore(now) && !task.isCompleted)
        .toList();
    setState(() {
      _expiredTasks.addAll(expired);
      _tasks.removeWhere((task) => expired.contains(task));
    });
  }

  Color _getTaskColor(DateTime dueDate) {
    final now = DateTime.now();
    final difference = dueDate.difference(now).inHours;

    if (difference <= 3) {
      return Colors.red;
    } else if (difference <= 24) {
      return Color(0xFFFFA500); // 黄色と赤色の中間色（オレンジ）
    } else if (difference <= 48) {
      return Colors.yellow;
    } else {
      return Colors.black;
    }
  }

  // 日付の色を決定するメソッドを追加
  Color _getDateColor(DateTime taskDate) {
    final today = DateTime.now();
    if (today.year == taskDate.year &&
        today.month == taskDate.month &&
        today.day == taskDate.day) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Task>> groupedTasks = {};
    for (var task in _tasks) {
      DateTime date =
          DateTime(task.dueDate.year, task.dueDate.month, task.dueDate.day);
      if (!groupedTasks.containsKey(date)) {
        groupedTasks[date] = [];
      }
      groupedTasks[date]!.add(task);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'タスク管理',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade200,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFE1E6),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent.shade200,
              ),
              child: Text(
                'メニュー',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('期限切れ'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CompletedTasksScreen.id,
                  arguments: _expiredTasks,
                );
              },
            ),
            ListTile(
              title: Text('フレンド'),
              onTap: () {
                Navigator.pushNamed(context, FriendScreen.id);
              },
            ),
            ListTile(
              title: Text('個人設定'),
              onTap: () {
                Navigator.pushNamed(context, SettingsScreen.id);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 16.0,
            bottom: 16.0,
            child: Column(
              children: [
                Image.asset(
                  'images/momo2.png',
                  height: 70.0,
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
          ListView(
            children: groupedTasks.keys.map((date) {
              List<Task> tasksForDate = groupedTasks[date]!;
              tasksForDate.sort((a, b) => a.dueDate.compareTo(b.dueDate));
              return Column(
                children: [
                  ExpansionTile(
                    title: Text(
                      "${date.year}/${date.month}/${date.day}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _getDateColor(date), // 日付の色を設定
                      ),
                    ),
                    children: tasksForDate.map((task) {
                      return ListTile(
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: _getTaskColor(task.dueDate),
                          ),
                        ),
                        subtitle: Text(
                            'Due: ${task.dueDate.hour}:${task.dueDate.minute}'),
                        trailing: IconButton(
                          icon: Icon(
                            task.isCompleted
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                          onPressed: () {
                            _toggleTaskCompletion(_tasks.indexOf(task));
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  Divider(), // 区切り線を追加
                ],
              );
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent.shade200,
      ),
    );
  }

  void _showAddTaskDialog() {
    TextEditingController titleController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('タスクを追加'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'タスク名'),
              ),
              SizedBox(height: 8.0),
              ListTile(
                title: Text(
                    '締切: ${selectedDate.year}/${selectedDate.month}/${selectedDate.day} ${selectedDate.hour}:${selectedDate.minute}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (pickedDate != null) {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(selectedDate),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        selectedDate = DateTime(
                            pickedDate.year,
                            pickedDate.month,
                            pickedDate.day,
                            pickedTime.hour,
                            pickedTime.minute);
                      });
                    }
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('キャンセル'),
            ),
            ElevatedButton(
              onPressed: () {
                _addTask(titleController.text, selectedDate);
                Navigator.pop(context);
              },
              child: Text('追加'),
            ),
          ],
        );
      },
    );
  }
}
