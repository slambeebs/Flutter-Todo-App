import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed; 
  MyButton({
    super.key,
    required this.text,
    required this.onPressed
    }
  );

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
      child: Text(text),
      );
  }
}