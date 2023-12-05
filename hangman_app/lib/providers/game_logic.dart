import 'package:flutter/material.dart';

import 'package:hangman_app/models/difficulties_model.dart';
import 'package:hangman_app/models/language_model.dart';
import '../utils/character_conversion_utils.dart';

class GameLogicModel with ChangeNotifier{
  int wrongCounter = 0;
  late List<String> gameWord;
  late List<String> guessedLetters;
  late List<String> displayWord;
  bool winner = false;
  bool inPlay = true;

  late Language language;
  late DifficultyLevel difficulty;
  

  GameLogicModel();

  void initialize(Language languge, DifficultyLevel difficulty, String word){
    inPlay = true;
    wrongCounter = 0;
    language = languge;
    difficulty = difficulty;
    gameWord = word.split('');
    guessedLetters = [];
    displayWord = List.filled(gameWord.length, '_');
    notifyListeners();
  }

  void checkGameStatus(){
    if(displayWord.join('').toLowerCase() == gameWord.join('').toLowerCase()) {
      winner = true;
      inPlay = false;
    } else if (wrongCounter > 6) {
      winner = false;
      inPlay = false;
    }
    notifyListeners();
  }

  String icelandicCharToEnglishChar(String char) {
    if (language == Language.Icelandic) {
      return IcelandicToEnglish(char)!.toLowerCase();
    } else {
      return '';
    }
  }

  bool isCorrect(String guessedLetter) {
    String guessed = guessedLetter.toLowerCase();
    String icelandicChar =
        icelandicCharToEnglishChar(guessedLetter.toUpperCase()).toLowerCase();
    if (gameWord.contains(guessed) || gameWord.contains(icelandicChar)) {
      return true;
    } else {
      return false;
    }
  }

  bool checkIfAlreadyGuessed(String guessedLetter) {
    String guessed = guessedLetter.toLowerCase();
    if (guessedLetters.contains(guessed)) {
      return true;
    } else {
      return false;
    }
  }

  void guessLetter(String guessedLetter) {
    String icelandicToEnglishChar = icelandicCharToEnglishChar(guessedLetter);
    String lowerGuessedLetter = guessedLetter.toLowerCase();

    if (checkIfAlreadyGuessed(lowerGuessedLetter)) {
      return;
    } else if (isCorrect(lowerGuessedLetter)) {
      for (int i = 0; i < gameWord.length; i++) {
        if (lowerGuessedLetter == gameWord[i].toLowerCase() ||
            icelandicToEnglishChar == gameWord[i].toLowerCase()) {
          displayWord[i] = gameWord[i].toUpperCase();
        }
      }
      guessedLetters.add(lowerGuessedLetter);
    } else {
      wrongCounter++;
      guessedLetters.add(lowerGuessedLetter);
    }
    notifyListeners();
  }

  String getDisplayWord() {
    return displayWord.join(' ');
  }
}
