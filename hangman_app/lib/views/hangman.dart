import 'package:flutter/material.dart';
import 'package:hangman_app/views/home.dart';

import 'end.dart';

import 'package:hangman_app/models/language_model.dart';
import 'package:hangman_app/models/difficulties_model.dart';
//import 'package:hangman_app/models/words_model.dart';
import 'package:hangman_app/models/api_model.dart';

import 'package:hangman_app/widgets/hangman/keyboard.dart';
import 'package:hangman_app/widgets/hangman/game_display.dart';
import 'package:hangman_app/widgets/hangman/game_logic.dart';
import 'package:hangman_app/widgets/hangman/hangman_figure.dart';

class HangmanView extends StatefulWidget {
  final Language language;
  final DifficultyLevel difficulty;

  const HangmanView(
      {Key? key, required this.language, required this.difficulty})
      : super(key: key);

  @override
  HangmanViewState createState() => HangmanViewState();
}

class HangmanViewState extends State<HangmanView> {
  late final word = Word();
  String? gameWord;
  GameLogic? gameLogic;
  String displayWord = '';

  @override
  void initState() {
    super.initState();
    fetchGameWord();
  }

  Future<void> fetchGameWord() async {
    try {
      final fetchedWord = await word.fetchWord(widget.language.name, widget.difficulty.name);

      if(fetchedWord.isNotEmpty){
        setState(() {
          gameWord = fetchedWord;
          gameLogic = GameLogic(widget.language, widget.difficulty, fetchedWord);
          displayWord = gameLogic!.getDisplayWord();
        });
      } else {
        print('Error fetcing word:');
      }
    } catch (e) {
      print("Error fetching word: $e");
    }
  }

  bool handleKeyPress(String key) {
  // Check if gameLogic is initialized before proceeding
  if (gameLogic == null) {
    // You might want to handle this case by showing an error
    // or simply returning false to indicate the key press was not successful
    print('Game logic not initialized yet.');
    return false;
  }

  bool correct = gameLogic!.isCorrect(key); // Using the null check operator (!)
  setState(() {
    gameLogic!.guessLetter(key); // Using the null check operator (!)
    displayWord = gameLogic!.getDisplayWord(); // Using the null check operator (!)
  });
  checkIfDone();
  return correct;
}

  void checkIfDone() {
  if (gameLogic == null) {
    print('Game logic not initialized yet.');
    return;
  }

  // It's assumed that displayWord and gameLogic.gameWord are initialized and updated properly
  String cleanDisplayWord = displayWord.replaceAll(' ', '').toLowerCase();
  String cleanGameWord = gameLogic!.gameWord.join('').toLowerCase(); // Ensure case consistency

  bool hasWon = cleanDisplayWord == cleanGameWord;
  bool hasLost = gameLogic!.wrongCounter > 6;

  if (hasWon || hasLost) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EndView(
            gameLogic: gameLogic!,
            winner: hasWon,
          ),
        ));
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
          title: const Text('Hangman'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeView(initialDifficulty: widget.difficulty, initialLanguage: widget.language))
              );
            },
          )
        ),
        body: gameLogic == null 
        ? const Center(child: CircularProgressIndicator()) 
        : WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  GameDisplay(displayWord: displayWord),
                  Expanded(child: HangmanFigure(lives: gameLogic!.wrongCounter)),
                ],
              )),
              OnScreenKeyboard(
                language: widget.language.name,
                onKeyPress: handleKeyPress,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
