import 'package:flutter/material.dart';
// type st to access snippets
class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText); 

  @override
  Widget build(BuildContext context) {
    return Container(
      //container and double.infinity takes the width of the whole screen
      //Container contains Margin > Border > Padding > child
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 30 ),
        textAlign: TextAlign.center,
      ),
    );
  }
}