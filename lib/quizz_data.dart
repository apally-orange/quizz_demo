class QuizzData {
  const QuizzData(
    this.correctLetter,
    this.letters,
  );

  final String correctLetter;
  final List<String> letters;
}

class QuizzResponse {
  const QuizzResponse(
    this.answer,
    this.isValid,
  );

  final String answer;
  final bool isValid;
}

extension QuizzResponseExt on QuizzResponse? {
  QuizzButtonState buttonState(String letter) {
    final current = this;

    if (current == null || letter != current.answer) {
      return QuizzButtonState.other;
    } else if (letter == current.answer && current.isValid) {
      return QuizzButtonState.valid;
    } else {
      return QuizzButtonState.invalid;
    }
  }
}

enum QuizzButtonState { valid, invalid, other }
