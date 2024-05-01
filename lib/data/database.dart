// ignore_for_file: unused_field

import 'package:hive_flutter/hive_flutter.dart';


class TodoDatabase {
  
  List todoList = [];
  final _myBox = Hive.box('newBox');

  //create initial data
  void creatInitialData (){
    todoList = [
      ['Sample Task', false],
    ];
  }

  //load data
  void loadDatabase (){
    todoList = _myBox.get('TODOLIST');
  }

  //update data
  void updateDatabase (){
    _myBox.put('TODOLIST', todoList);
  }
}