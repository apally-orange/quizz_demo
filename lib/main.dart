import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_button_quizz/notifier.dart';
import 'package:multi_button_quizz/quizz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(quizzStateProvider, (_, response) {
      if (response != null) {
        final snackBar = SnackBar(
          content: Text(
            response.isValid ? 'Felicitation !' : 'Vous avez fait un erreur',
          ),
          action: SnackBarAction(
            label: 'next',
            backgroundColor:
                response.isValid ? Colors.greenAccent : Colors.redAccent,
            onPressed: () {
              ref.invalidate(quizzStateProvider);
              ref.read(currentIndexProvider.notifier).increment();
            },
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    final index = ref.watch(currentIndexProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Quizz $index'),
      ),
      body: const QuizzBodyView(),
    );
  }
}
