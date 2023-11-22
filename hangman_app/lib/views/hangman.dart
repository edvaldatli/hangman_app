import 'package:flutter/material.dart';

import 'package:hangman_app/widgets/hangman/keyboard.dart';
import 'package:hangman_app/models/language_model.dart';
import 'package:hangman_app/models/difficulties_model.dart';

import 'package:hangman_app/models/words_model.dart';
import 'package:hangman_app/widgets/hangman/game_display.dart';
import 'package:hangman_app/widgets/hangman/game_logic.dart';

class HangmanView extends StatefulWidget {
  final Language language;
  final DifficultyLevel difficulty;

  HangmanView({Key? key, required this.language, required this.difficulty})
      : super(key: key);

  @override
  _HangmanViewState createState() => _HangmanViewState();
}

class _HangmanViewState extends State<HangmanView> {
  late GameLogic gameLogic;

  @override
  void initState() {
    super.initState();
    gameLogic = GameLogic(widget.language.name, widget.difficulty,
        words.getRandomWord(widget.language, widget.difficulty)!.wordString);
  }

  void handleKeyPress(String key) {
    print('Pressed: $key');
    bool isCorrect = gameLogic.guessLetter(key);
    // Now, depending on if the guess is correct, you would update the UI or handle the game logic accordingly
    // You do not need to pass isCorrect back to the keyboard, you only need to update the state of the keys in this function.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GameDisplay(displayWord: gameLogic.getDisplayWord()),
          OnScreenKeyboard(
              language: widget.language.name,
              onKeyPress: handleKeyPress,
          )
        ],
      ),
    );
  }
}
