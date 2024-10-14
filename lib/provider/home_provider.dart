import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/modalClass.dart';

class HomeProvider extends ChangeNotifier
{
  List <Student> todoList = [];

  void addTask(String description,String task,DateTime datetime) {
    String formatted = DateFormat('hh:mm a').format(datetime);
    todoList.add(Student(task: task, description: description, datetime: formatted));

    notifyListeners();
  }


  void removestudent(int index)
  {
    todoList.removeAt(index);
    notifyListeners();
  }

  void updatestudent(String description , String task,DateTime datetime, int index)
  {
    String formatted = DateFormat('hh : mm a ').format(datetime);
    todoList[index].description=description;
    todoList[index].task=task;
    todoList[index].datetime=formatted;
    isCompleted: todoList[index].isCompleted;
    notifyListeners();
  }
  void toggleCompleted(int index)
  {
    todoList[index].isCompleted=!todoList[index].isCompleted;
    notifyListeners();
  }


}