import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'ADD YOUR TASKS'),
    Task(name: 'CHECK THEM WHEN YOU DO THEM'),
    Task(name: 'LONG PRESS = DELETE')
  ];

  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
