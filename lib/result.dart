import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
      String resultText;
      if (resultScore >= 60) {
        resultText = 'You\'re Great';
      } else {
        resultText = 'You can become greater next time';
      }
      return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase, 
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          // FlatButton is a button without bg color
          // bind the reset event to onPressed
          FlatButton(
            child: Text(
              'Restart Quiz!'
              ),
              textColor: Colors.deepPurple[200], 
            onPressed: resetHandler,
            ),
        ],
      ),
    );
  }
}