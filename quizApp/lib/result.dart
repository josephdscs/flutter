import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function onReset;

  Result({this.score, this.onReset});

  String get resultPhrase {
    if (score < 9) {
      return 'You are awesome!';
    } else if (score < 13) {
      return 'You are pretty likable!';
    } else if (score < 16) {
      return 'What is wrong with you?!';
    } else {
      return 'You are bad ;)!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: onReset,
            child: Text(
              'Restart',
            ),
            textColor: Colors.blue,
          ),
          Text('Your Score is ' + score.toString()),
        ],
      ),
    );
  }
}
