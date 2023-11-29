import 'package:flutter/material.dart';
import 'package:hangman_app/views/hangman.dart';
import 'package:hangman_app/views/home.dart';

import 'package:hangman_app/widgets/hangman/game_logic.dart';

class EndView extends StatefulWidget {
  final bool winner;
  final GameLogic gameLogic;

  const EndView({super.key, required this.winner, required this.gameLogic});

  @override
  EndViewState createState() => EndViewState();
}

class EndViewState extends State<EndView> {
  late GameLogic gameLogic = widget.gameLogic;
  late String gameWord = widget.gameLogic.gameWord.join('');
  late List<String> guessedLetters = widget.gameLogic.guessedLetters;
  late bool winner = widget.winner;

  void backToMenu() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(
            initialDifficulty: gameLogic.difficulty,
            initialLanguage: gameLogic.language,
          ),
        ));
  }

  void retryGame() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HangmanView(
            difficulty: gameLogic.difficulty,
            language: gameLogic.language,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.winner ? 'You won!' : 'You lost :(',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'The word was:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              gameWord,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Text('You guessed: '),
            Text(guessedLetters.join(', ')),
            const SizedBox(
              height: 70,
            ),
            retryButton(),
            const SizedBox(
              height: 5,
            ),
            backToMenuButton()
          ],
        )),
      ),
    );
  }

  FilledButton backToMenuButton() {
    return FilledButton.icon(
              onPressed: backToMenu,
              icon: const Icon(Icons.home_filled),
              label: const Text('Back to menu'));
  }

  FilledButton retryButton() {
    return FilledButton.icon(
            onPressed: retryGame,
            icon: const Icon(Icons.refresh_sharp),
            label: const Text('Retry'),
          );
  }
}
