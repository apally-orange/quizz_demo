import 'package:multi_button_quizz/quizz_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@riverpod
class CurrentQuizz extends _$CurrentQuizz {
  @override
  QuizzData build() {
    // TODO recuperer par un repo qui lit un fichier ou un API en fonction de l'avancer dans la lesson

    return const QuizzData(
      'A',
      [
        'E',
        'I',
        'A',
        'D',
      ],
    );
  }
}

@riverpod
class QuizzState extends _$QuizzState {
  @override
  QuizzResponse? build() {
    return null;
  }

  void setResponse(String letter) {
    final correctLetter = ref.read(currentQuizzProvider).correctLetter;

    state = QuizzResponse(letter, letter == correctLetter);
  }
}
