import 'package:flutter/material.dart';

class GameDisplay extends StatelessWidget {
  final String displayWord;

  const GameDisplay({Key? key, required this.displayWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
      height: 50,
      alignment: Alignment.center,
      child: Text(
        displayWord,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}