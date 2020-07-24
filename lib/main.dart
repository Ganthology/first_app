import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  // use runApp() function to run the app
  // it will call the build() method in the class
  runApp(MyApp());
}
// void main() => runApp(MyApp());

// use _MyApp instead of MyApp will make the class private
class MyApp extends StatefulWidget {
// StatefulWidget is a combination of two classes
// StatefulWidget and State

  @override
  // use createState() to create connection between widget and the state
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// State<MyApp> to indicate connection
class _MyAppState extends State<MyApp> {
  // questions is a list of maps
  final _questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10}, 
          {'text': 'Red', 'score': 30}, 
          {'text': 'Green', 'score':50}, 
          {'text': 'White', 'score': 5},
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 40}, 
          {'text': 'Lion', 'score': 20}, 
          {'text': 'Tiger', 'score': 30}, 
          {'text': 'Dragon', 'score': 50}],
      },
      {
        'questionText': 'What\'s your favorite country?',
        'answers': [
          {'text': 'Singapore', 'score': 40}, 
          {'text': 'Korea', 'score': 20}, 
          {'text': 'Malaysia', 'score': 30}, 
          {'text': 'Taiwan', 'score': 50}
          ],
      },
    ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // _totalScore = _totalScore + score;
    _totalScore += score;
    // setState() will update the state and rebuild the app again
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more question");
    } else {
      print("No more questions!");
    }
  }
  // build(BuildContext) method is the abstract method from Stateless Widget
  // @override is a decorator, indicate we override the method
  // the build() method will return a widget
  @override
  Widget build(BuildContext context) {
    
    // Text() is also a widget
    return MaterialApp(
      home: Scaffold(
        // AppBar() is the default AppBar class in material
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length 
          ? Quiz(
            answerQuestion: _answerQuestion, 
            questionIndex: _questionIndex, 
            questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
      ),
     );
  }
}
// Good etiquette: Have only one widget per file/class

