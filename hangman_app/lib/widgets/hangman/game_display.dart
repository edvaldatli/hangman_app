import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hangman_app/providers/game_logic.dart';

class GameDisplay extends StatelessWidget {

  const GameDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameLogic = Provider.of<GameLogicModel>(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      height: 50,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            gameLogic.displayWord.join(''),
            style: const TextStyle(
              letterSpacing: 7,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
