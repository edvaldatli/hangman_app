import 'package:flutter/material.dart';

import 'end.dart';

import 'package:hangman_app/models/language_model.dart';
import 'package:hangman_app/models/difficulties_model.dart';
import 'package:hangman_app/models/words_model.dart';

import 'package:hangman_app/widgets/hangman/keyboard.dart';
import 'package:hangman_app/widgets/hangman/game_display.dart';
import 'package:hangman_app/widgets/hangman/game_logic.dart';
import 'package:hangman_app/widgets/hangman/hangman_figure.dart';

class HangmanView extends StatefulWidget {
  final Language language;
  final DifficultyLevel difficulty;

  const HangmanView({Key? key, required this.language, required this.difficulty})
      : super(key: key);

  @override
  HangmanViewState createState() => HangmanViewState();
}

class HangmanViewState extends State<HangmanView> {
  late GameLogic gameLogic;
  late String displayWord = gameLogic.getDisplayWord();

  @override
  void initState() {
    gameLogic = GameLogic(widget.language, widget.difficulty,
        words.getRandomWord(widget.language, widget.difficulty)!.wordString);
    displayWord = gameLogic.getDisplayWord();
    super.initState();
  }

  bool handleKeyPress(String key) {
    bool correct;
    correct = gameLogic.guessLetter(key);
    setState(() {
      displayWord = gameLogic.getDisplayWord();
    });
    checkIfDone();
    return correct;
  }

  void checkIfDone(){
    String cleanDisplayWord = displayWord.replaceAll(' ', '').toLowerCase();
    String cleanGameWord = gameLogic.gameWord.join('');

    if(cleanDisplayWord == cleanGameWord){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:(context) => EndView(),
        )
      );
    } else if (gameLogic.wrongCounter > 6){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:(context) => EndView()
        )
      );
    }
  }

  bool isCorrect(String key){
    return gameLogic.guessLetter(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                GameDisplay(displayWord: displayWord),
                Expanded(child: HangmanFigure(lives: gameLogic.wrongCounter)),
              ],
            )),
          
          
          OnScreenKeyboard(
              language: widget.language.name,
              onKeyPress: handleKeyPress,
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
