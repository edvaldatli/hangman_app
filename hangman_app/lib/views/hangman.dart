import 'package:flutter/material.dart';

import 'package:hangman_app/widgets/hangman/keyboard.dart';
import 'package:hangman_app/models/language_model.dart';

class HangmanView extends StatefulWidget {
  final Language language;

  HangmanView({required this.language});
  @override
  State<StatefulWidget> createState() => HangmanViewState();
}

class HangmanViewState extends State<HangmanView> {
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Hangman'),
          OnScreenKeyboard(
            language: widget.language.name,
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}
