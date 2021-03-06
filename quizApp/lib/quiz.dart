import 'package:flutter/widgets.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final Map<String, Object> question;
  final Function onAnswerQuestion;

  Quiz({
    @required this.question,
    @required this.onAnswerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          question['questionText'],
        ),
        ...(question['answer'] as List<Map<String, Object>>).map(
          (ans) => Answer(
            onAnswer: onAnswerQuestion,
            answer: ans,
          ),
        )
      ],
    );
  }
}
