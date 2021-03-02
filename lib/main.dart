import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

void main() => runApp(MyQuizApp());

class MyQuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyQuizAppState();
  }
}

class _MyQuizAppState extends State<MyQuizApp> {
  var _questions = [
    {
      'questionText': 'What\'s your color?',
      'answer': ['Black', 'Red', 'Blue', 'Green'],
    },
    {
      'questionText': 'What\'s your animal?',
      'answer': ['Tiger', 'Bear', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'What\'s your Instructor?',
      'answer': ['Joseph', 'Noa', 'Max'],
    },
  ];
  int _questionIdx = 0;
  void _answerQuestion() {
    setState(() {
      if (_questionIdx < (_questions.length - 1)) {
        _questionIdx++;
      } else {
        _questionIdx = 0;
      }
    });
    print('Answer Question!');
    print(_questionIdx);
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My App'),
          ),
          body: Column(
            children: [
              Question(
                _questions[_questionIdx]['questionText'],
              ),
              ...(_questions[_questionIdx]['answers'] as List<String>).map((a) {
                return Answer(_answerQuestion, a);
              }).toList(),
            ],
          )),
    );
  }
}
