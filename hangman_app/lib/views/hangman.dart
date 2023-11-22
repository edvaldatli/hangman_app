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

  void _onKeyPress(String key) {
    setState(() {
      gameLogic.guessLetter(key);
    });
  }

  bool handleKeyPress(String key) {
    bool isCorrect = gameLogic.guessLetter(key);
    // Perform other state updates if necessary
    setState(() {});
    return isCorrect;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GameDisplay(displayWord: gameLogic.getDisplayWord()),
          OnScreenKeyboard(
            language: widget.language.name,
            onKeyPress: handleKeyPress
          ),
        ],
      ),
    );
  }
}
