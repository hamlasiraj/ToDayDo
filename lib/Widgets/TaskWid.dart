import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'TaskList.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/Models/DATA.dart';

class TaskWid extends StatefulWidget {
  @override
  State<TaskWid> createState() => _TaskWidState();
}

class _TaskWidState extends State<TaskWid> {
  final _mybox = Hive.box('mybox');
  TaskData taskData = TaskData();
  @override
  void initState() {
    if (_mybox.get('TODAYDO') == null) {
      taskData.createIncialData();
    } else {
      taskData.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxChange: (newValue) {
                taskData.updateTask(taskData.tasks[index]);
              },
              listTileDelete: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
