import 'package:flutter/material.dart';

class Student{
  late String task,description;
  late String datetime;
  bool isCompleted;

  Student({required this.task,required this.description , required this.datetime, this.isCompleted=false,});
}