import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hangman_app/views/hangman_view.dart';
import 'package:hangman_app/views/home_view.dart';

import 'package:hangman_app/providers/game_logic.dart';

class EndViewScreen extends StatefulWidget{
  const EndViewScreen({super.key});

  @override
  EndViewScreenState createState() => EndViewScreenState();
}

class EndViewScreenState extends State<EndViewScreen> {

  void backToMenu() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ));
  }

  void retryGame() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HangmanGameView(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final gameLogic = Provider.of<GameLogicModel>(context);
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
              gameLogic.winner ? 'You won!' : 'You lost :(',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
              gameLogic.gameWord.join(''),
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Text('You guessed: '),
            Text(gameLogic.guessedLetters.join(', ')),
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
