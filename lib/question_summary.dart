import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // here we use type casting
                    // there is sometimes a situation that we know more than a type of some data than the dart
                    Container(
                      width: 35,
                      height: 35,
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            30), // Half of the height for a perfect circle
                      ),
                      child: Center(
                        child: Text(
                          ((data["question_index"] as int) + 1).toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["question"] as String,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data["user_answer"] as String,
                            style: TextStyle(
                                color: Color.fromARGB(255, 225, 169, 235),
                                fontSize: 16),
                          ),
                          Text(
                            data["correct_answer"] as String,
                            style: TextStyle(
                                color: Color.fromARGB(255, 57, 232, 63),
                                fontSize: 16),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
