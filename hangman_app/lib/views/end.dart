import 'package:flutter/material.dart';
import 'package:hangman_app/views/hangman.dart';
import 'package:hangman_app/views/home.dart';

import 'package:hangman_app/widgets/hangman/game_logic.dart';

class EndView extends StatefulWidget{
  final bool winner;
  final GameLogic gameLogic;

  const EndView({required this.winner, required this.gameLogic});

  @override
  EndViewState createState() => EndViewState();
}

class EndViewState extends State<EndView>{
  late GameLogic gameLogic = widget.gameLogic;
  late String gameWord = widget.gameLogic.gameWord.join('');
  late bool winner = widget.winner;

  void backToMenu(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(
          initialDifficulty: gameLogic.difficulty,
          initialLanguage: gameLogic.language,
        ),
      )
    );
  }

  void retryGame(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder:(context) => HangmanView(
            difficulty: gameLogic.difficulty,
            language: gameLogic.language,
          ),
        )
      );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.winner ? 'You won!' : 'You lost :(',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 40,),
          Text(!winner ? 'Your word was:' : ''),
          Text(
            gameWord,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 70,),
          ElevatedButton(onPressed: retryGame, child: Text('Retry')),
          ElevatedButton(onPressed: backToMenu, child: Text('Back to menu'))
        ],
      )),
    );
  }
}