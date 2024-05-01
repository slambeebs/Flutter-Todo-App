// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//reference box
  final _myBox = Hive.box('newBox');
  TodoDatabase db = TodoDatabase();
  
  @override
  void initState() {
    //first time running the app
    if (_myBox.get('TODOLIST') == null){
      db.creatInitialData();
    }
    else {
      db.loadDatabase();
    }
    super.initState();
  }


  //checkbox function
void checkBoxChange (bool? value, int index){
  setState(() {
    db.todoList[index][1] = !db.todoList[index][1];
  });
  db.updateDatabase();
}

//text controller
final _controller = TextEditingController();

//save new task
void saveNewTask (){
  setState(() {
     db.todoList.add([_controller.text, false]); 
     _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateDatabase();
}

//adding new task
void createNewTask(){
  showDialog(context: context, builder:(context) {
    return DialogBox(
      controller: _controller,
      onSave: saveNewTask,
      onCancel: () => Navigator.of(context).pop(),
      );
  },);
}

//deleting a task
void deleteTask (int index){
  setState(() {
    db.todoList.removeAt(index);
  });
  db.updateDatabase();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar (
        title: const Text('Todo App'),
      ),
    
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
          taskName: db.todoList[index][0], 
          taskCompleted: db.todoList[index][1], 
          onChanged:(value) => checkBoxChange(value, index),
          deleteFunction: (context) => deleteTask(index),
          );
        }, //itemBuilder
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 40)
        ),
      );
  }
}