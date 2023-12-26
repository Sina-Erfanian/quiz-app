import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity, // take the entire width
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // we use map like this in flutter
            // the result of map would be an array and thats why we use spread operator (...) because the children dont want array but it wants widget
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    widget.onSelectAnswer(answer);
                    setState(() {
                      currentQuestionIndex++;
                    });
                  });
            })
          ],
        ),
      ),
    );
  }
}
