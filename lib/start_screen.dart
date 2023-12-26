import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeActiveScreen, {super.key});

  final void Function() changeActiveScreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 280,
          height: 280,
          color: Color.fromARGB(188, 255, 255, 255),
        ),
        const SizedBox(height: 40),
        Text(
          "Learn flutter the fun way 😁",
          style: GoogleFonts.inconsolata(
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton.icon(
            onPressed: changeActiveScreen,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.fromLTRB(20, 10, 20, 10),
              ),
              backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 165, 92, 177),
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            label: const Text(
              "Start Quiz",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ]),
    );
  }
}
