import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.chosenAnswer, required this.onRestart});

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final allQuestions = questions.length;
    // we can use arrow function in dart like this () => it return immediately
    final correctQuestions = summaryData
        .where((element) => element["correct_answer"] == element["user_answer"])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQuestions out of $allQuestions question correctly!',
              style: GoogleFonts.acme(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 91, 52, 231),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 9)),
                onPressed: onRestart,
                icon: const Icon(
                  Icons.restart_alt_rounded,
                  size: 27,
                ),
                label: const Text(
                  "Restart quiz",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                )),
          ],
        ),
      ),
    );
  }
}
