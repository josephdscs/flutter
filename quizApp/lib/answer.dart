import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onAnswer;
  final Map<String, Object> answer;

  Answer({this.onAnswer, this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text(answer['text']),
        onPressed: () => onAnswer(answer['score']),
      ),
    );
  }
}
