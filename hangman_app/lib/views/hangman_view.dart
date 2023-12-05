import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hangman_app/views/home_view.dart';
import 'package:hangman_app/views/end_view.dart';

import 'package:hangman_app/providers/game_logic.dart';
import 'package:hangman_app/providers/game_settings.dart';

import 'package:hangman_app/services/api_model.dart';

import 'package:hangman_app/widgets/hangman/keyboard.dart';
import 'package:hangman_app/widgets/hangman/game_display.dart';
import 'package:hangman_app/widgets/hangman/hangman_figure.dart';

class HangmanGameView extends StatefulWidget {
  const HangmanGameView({super.key});

  @override
  HangmanGameViewState createState() => HangmanGameViewState();
}

class HangmanGameViewState extends State<HangmanGameView> {
  late final WordService wordService;
  late final GameLogicModel gameLogic;
  late final GameSettingsModel gameSettings;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    gameSettings = Provider.of<GameSettingsModel>(context, listen: false);
    gameLogic = Provider.of<GameLogicModel>(context, listen: false);
    wordService = WordService();
    startGame();
  }

  Future<void> startGame() async {
    final gameSettings = Provider.of<GameSettingsModel>(context, listen: false);
    setState(() {
      isLoading = true;
    });
    try {
      final fetchedWord = await wordService.fetchWord(gameSettings.language.name, gameSettings.difficultyLevel.name);

      if(fetchedWord.isNotEmpty){
        gameLogic.initialize(gameSettings.language, gameSettings.difficultyLevel, fetchedWord);
        setState(() {
          isLoading = false;
        });
      } else {
        print('Error fetcing word:');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching word: $e");
      isLoading = false;
    }
  }

  bool handleKeyPress(String key) {
    bool correct = gameLogic.isCorrect(key);
    gameLogic.guessLetter(key);
    gameLogic.checkGameStatus();
    checkIfDone();
    return correct;
  }

  void checkIfDone() {
    if (!gameLogic.inPlay) {
      print(gameLogic.winner);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EndViewScreen(),
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
          title: const Text('Hangman'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeView())
              );
            },
          )
        ),
        body: isLoading 
        ? const Center(child: CircularProgressIndicator()) 
        : WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: Column(
            children: [
              const Expanded(
                  child: Column(
                children: [
                  GameDisplay(),
                  Expanded(child: HangmanFigure()),
                ],
              )),
              OnScreenKeyboard(
                language: gameSettings.language.name,
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
