import 'package:hangman_app/models/difficulties_model.dart';
import 'package:hangman_app/models/language_model.dart';
import 'icelandic_characters.dart';

class GameLogic {
  int wrongCounter = 0;

  late List<String> gameWord;
  late List<String> guessedLetters;
  late List<String> displayWord;

  Language language;
  DifficultyLevel difficulty;

  GameLogic(this.language, this.difficulty, String word) {
    gameWord = word.split('');
    guessedLetters = [];
    displayWord = List.filled(gameWord.length, '_');
  }

  String icelandicCharToEnglishChar(String char){
    if(language == Language.Icelandic){
      return IcelandicToEnglish(char)!.toLowerCase();
    } else {
      return '';
    }
  }

  bool isCorrect(String guessedLetter){
    String guessed = guessedLetter.toLowerCase();
    String icelandicChar = icelandicCharToEnglishChar(guessedLetter.toUpperCase()).toLowerCase();
    if(gameWord.contains(guessed) || gameWord.contains(icelandicChar)){
      return true;
    } else {
      return false;
    }
  }

  bool checkIfAlreadyGuessed(String guessedLetter) {
    String guessed = guessedLetter.toLowerCase();
    if(guessedLetters.contains(guessed)){
      return true;
    } else {
      return false;
    }
  }

  void guessLetter(String guessedLetter) {
    String icelandicToEnglishChar = icelandicCharToEnglishChar(guessedLetter);
    String lowerGuessedLetter = guessedLetter.toLowerCase();

    if(checkIfAlreadyGuessed(lowerGuessedLetter)){
      return;
    } else if (isCorrect(lowerGuessedLetter)){
      for (int i = 0; i < gameWord.length; i++) {
        if(lowerGuessedLetter == gameWord[i].toLowerCase() || icelandicToEnglishChar == gameWord[i].toLowerCase()){
          displayWord[i] = gameWord[i].toUpperCase();
        }
        
      }
      guessedLetters.add(lowerGuessedLetter);
    } else {
      wrongCounter++;
      guessedLetters.add(lowerGuessedLetter);
    }
  }

  String getDisplayWord() {
    return displayWord.join(' ');
  }
}
