class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;
// instead of method we can use getter
// it is a little bit shorter and we shouldn't call it like this getShuffledAnswers() instead we call it like property
  // List<String> getShuffledAnswers() {
  //   // create a copy of existing List (array)
  //   final shuffledArray = List.of(answers);
  //   // mutate the list
  //   shuffledArray.shuffle();
  //   return shuffledArray;
  // }

  List<String> get shuffledAnswers {
    // create a copy of existing List (array)
    final shuffledArray = List.of(answers);
    // mutate the list
    shuffledArray.shuffle();
    return shuffledArray;
  }
}
