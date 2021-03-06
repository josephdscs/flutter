import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  Result({this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('You did it!!!'),
          Text('Your Score is ' + score.toString()),
        ],
      ),
    );
  }
}
