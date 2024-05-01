import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_buttons.dart';


// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
DialogBox({super.key, 
  required this.controller,
  required this.onSave,
  required this.onCancel,
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(), 
                  hintText: "Create New Task.." ),
              ),

              const SizedBox(height: 8 ,),

              //save + cancel button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", onPressed:onSave),
                  const SizedBox(width: 10,), 
                  MyButton(text: "Cancel", onPressed:onCancel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}