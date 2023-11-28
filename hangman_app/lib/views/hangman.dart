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
  late GameLogic gameLogic = GameLogic(widget.language, widget.difficulty, words.getRandomWord(widget.language, widget.difficulty)!.wordString);
  late String displayWord = gameLogic.getDisplayWord();

  @override
  void initState() {
    print(displayWord);
    print(gameLogic.gameWord);
    super.initState();
  }

  bool handleKeyPress(String key) {
    bool correct;
    correct = gameLogic.isCorrect(key);
    print(correct);
    setState(() {
      gameLogic.guessLetter(key);
      displayWord = gameLogic.getDisplayWord();
    });
    checkIfDone();
    return correct;
  }

  void checkIfDone(){
    String cleanDisplayWord = displayWord.replaceAll(' ', '').toLowerCase();
    String cleanGameWord = gameLogic.gameWord.join('');

    print(cleanDisplayWord);
    print(cleanGameWord);

    if(cleanDisplayWord == cleanGameWord || gameLogic.wrongCounter > 6){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:(context) => EndView(
            gameLogic: gameLogic,
            winner: cleanDisplayWord == cleanGameWord,
          ),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hangman'),
        ),
        body: WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: Column(
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
        ),
      ),
    );
  }
}
