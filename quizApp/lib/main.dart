import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyQuizApp());

class MyQuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyQuizAppState();
  }
}

const _questions = [
  {
    'questionText': 'What\'s your color?',
    'answer': [
      {'text': 'Black', 'score': 10},
      {'text': 'Red', 'score': 7},
      {'text': 'Blue', 'score': 3},
      {'text': 'Green', 'score': 1},
    ],
  },
  {
    'questionText': 'What\'s your animal?',
    'answer': [
      {'text': 'Bear', 'score': 10},
      {'text': 'Lion', 'score': 7},
      {'text': 'Tiger', 'score': 3},
      {'text': 'Elephant', 'score': 1},
    ],
  },
  {
    'questionText': 'What\'s your Instructor?',
    'answer': [
      {'text': 'Max', 'score': 10},
      {'text': 'Joseph', 'score': 7},
      {'text': 'Noa', 'score': 1},
    ],
  },
];

class _MyQuizAppState extends State<MyQuizApp> {
  int _questionIdx = 0;
  bool _hasMoreQuestions = true;
  int _totalScore = 0;

  void _onAnswerQuestion(int score) {
    setState(() {
      _totalScore += score;
      if (_questionIdx < (_questions.length - 1)) {
        _questionIdx++;
      } else {
        _hasMoreQuestions = false;
      }
    });
    print(_questionIdx);
    print('Answer Question!');
    print('Answer Question! => ' + score.toString());
  }

  void _resetQuiz() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
      _hasMoreQuestions = true;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: _hasMoreQuestions
          ? Quiz(
              question: _questions[_questionIdx],
              onAnswerQuestion: _onAnswerQuestion,
            )
          : Result(
              score: _totalScore,
              onReset: _resetQuiz,
            ),
    ));
  }
}
