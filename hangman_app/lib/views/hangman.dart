import 'package:flutter/material.dart';

import 'package:hangman_app/widgets/hangman/keyboard.dart';
import 'package:hangman_app/models/language_model.dart';
import 'package:hangman_app/models/difficulties_model.dart';

import 'package:hangman_app/models/words_model.dart';
import 'package:hangman_app/widgets/hangman/letter_manager.dart';

class HangmanView extends StatefulWidget {
  final Language language;
  final DifficultyLevel difficulty;

  HangmanView({required this.language, required this.difficulty});
  @override
  State<StatefulWidget> createState() => HangmanViewState();
}

class HangmanViewState extends State<HangmanView> {
  late String word;
  String? guessedWord;

  void _handleKeyPress(String key){
    print("Pressed: $key");
  }

  @override
  void initState(){
    super.initState();
    word = words.getRandomWord(widget.language, widget.difficulty)!.wordString;
  }
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Letters(word: word),
          Text(word),
          OnScreenKeyboard(
            language: widget.language.name,
            onKeyPress: _handleKeyPress
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}

