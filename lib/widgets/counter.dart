// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class count extends StatelessWidget {
 final int allToDo;
  final int allCompleted;
  const count({super.key, required this.allCompleted, required this.allToDo});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "$allCompleted/$allToDo",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, 
            color: allCompleted==allToDo ? Color.fromARGB(255, 142, 253, 200) : Colors.white
            ),
      ),
    );
  }
}
