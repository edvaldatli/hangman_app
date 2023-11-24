import 'package:hangman_app/models/difficulties_model.dart';

class GameLogic {
  int lives = 7;

  late List<String> gameWord;
  late Set<String> guessedLetters;
  late List<String> displayWord;

  String language;
  DifficultyLevel difficulty;

  // Todo: Add icelandic characters to be associated with the "same" character

  GameLogic(this.language, this.difficulty, String word) {
    gameWord = word.split('');
    guessedLetters = {};
    displayWord = List.filled(gameWord.length, '_');
  }

  bool guessLetter(String guessedLetter) {
    bool isCorrect = false;
    String lowerGuessedLetter = guessedLetter.toLowerCase();

    for (int i = 0; i < gameWord.length; i++) {
      if (lowerGuessedLetter == gameWord[i].toLowerCase()) {
        displayWord[i] = gameWord[i].toUpperCase();
        isCorrect = true;
      }
    }

    if (!isCorrect) {
      guessedLetters.add(lowerGuessedLetter);
    }

    return isCorrect;
  }

  String getDisplayWord() {
    return displayWord.join(' ');
  }
}
