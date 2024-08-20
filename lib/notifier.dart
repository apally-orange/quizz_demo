import 'package:multi_button_quizz/quizz_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

const listQuizz = [
  QuizzData(
    'A',
    [
      'E',
      'I',
      'A',
      'D',
    ],
  ),
  QuizzData(
    'L',
    [
      'E',
      'P',
      'L',
      'D',
    ],
  ),
  QuizzData(
    'E',
    [
      'A',
      'E',
      'I',
      'D',
    ],
  ),
  QuizzData(
    'I',
    [
      'E',
      'A',
      'D',
      'I',
    ],
  ),
];

@riverpod
class CurrentIndex extends _$CurrentIndex {
  @override
  int build() {
    return 0;
  }

  void increment() {
    if (state == listQuizz.length - 1) {
      state = 0;
    } else {
      state++;
    }
  }
}

@riverpod
class CurrentQuizz extends _$CurrentQuizz {
  @override
  QuizzData build() {
    // TODO recuperer par un repo qui lit un fichier ou un API en fonction de l'avancer dans la lesson
    final index = ref.watch(currentIndexProvider);

    return listQuizz[index];
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
