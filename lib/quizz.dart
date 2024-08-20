import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_button_quizz/notifier.dart';
import 'package:multi_button_quizz/quizz_data.dart';

class QuizzBodyView extends ConsumerWidget {
  const QuizzBodyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizzData = ref.watch(currentQuizzProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (final letter in quizzData.letters)
            _LetterButton(
              letter: letter,
            )
        ],
      ),
    );
  }
}

class _LetterButton extends ConsumerWidget {
  const _LetterButton({
    required this.letter,
  });

  final String letter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizzResponse = ref.watch(quizzStateProvider);
    final buttonState = quizzResponse.buttonState(letter);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: switch (buttonState) {
            QuizzButtonState.valid => Colors.greenAccent,
            QuizzButtonState.invalid => Colors.redAccent,
            _ => Colors.white,
          },
        ),
        onPressed: quizzResponse == null
            ? () {
                ref.watch(quizzStateProvider.notifier).setResponse(letter);
              }
            : null,
        child: Text(letter),
      ),
    );
  }
}
