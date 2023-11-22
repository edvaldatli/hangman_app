import 'package:hangman_app/models/difficulties_model.dart';

class GameLogic {
  late List<String> gameWord;
  late Set<String> guessedLetters;
  late List<String> displayWord;

  // The current language and difficulty of the game
  String language;
  DifficultyLevel difficulty;

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
        displayWord[i] = gameWord[i];
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
