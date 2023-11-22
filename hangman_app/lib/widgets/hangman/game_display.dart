import 'package:flutter/material.dart';

class GameDisplay extends StatelessWidget {
  final String displayWord;

  const GameDisplay({Key? key, required this.displayWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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