import 'package:flutter/material.dart';

class Letters extends StatefulWidget{
  final String word;
  
  Letters({required this.word});
  LettersState createState() => LettersState();
}

class LettersState extends State<Letters>{
  late String word;
  List<String>? guessedLetters;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    word = widget.word;
  }

  List<String>? handleWord(String word, List<String> guessed){
    List<String> wordList = word.split('');
    for(String letter in wordList){
      guessedLetters!.add('_');
    }
    return guessedLetters;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        ListView.builder(
          itemCount: word.length,
          itemBuilder: (context, index) {
            return Text(guessedLetters![index]);
          },
        )
      ],
    );
  }
}