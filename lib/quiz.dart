import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Question(
              questions[questionIndex]['questionText'],
            ),
            // RaisedButton() creates a button
            // We put bracket around the questions[][] as List<String> to tell that it is a List of String
            ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
              // answerQuestion <= will return the address of the function
              // answerQuestion() <= gets call whenever onPressed is triggered
              return Answer(() => answerQuestion(answer['score']), answer['text']);
            }).toList()
          ],
        );
  }
}
