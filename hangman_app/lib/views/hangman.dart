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
  late String displayWord = gameLogic.getDisplayWord();

  @override
  void initState() {
    gameLogic = GameLogic(widget.language.name, widget.difficulty,
        words.getRandomWord(widget.language, widget.difficulty)!.wordString);
    displayWord = gameLogic.getDisplayWord();
    super.initState();
  }

  void handleKeyPress(String key) {
    bool correct;
    print('Pressed: $key');
    correct = isCorrect(key);
    setState(() {
      displayWord = gameLogic.getDisplayWord();
    });
    print('hangman.dart');
    print(correct);
  }

  bool isCorrect(String key){
    return gameLogic.guessLetter(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GameDisplay(displayWord: displayWord),
          OnScreenKeyboard(
              language: widget.language.name,
              onKeyPress: handleKeyPress,
          )
        ],
      ),
    );
  }
}
