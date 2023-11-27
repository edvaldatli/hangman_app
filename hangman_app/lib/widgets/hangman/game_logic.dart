import 'package:hangman_app/models/difficulties_model.dart';
import 'package:hangman_app/models/language_model.dart';
import 'icelandic_characters.dart';

class GameLogic {
  int wrongCounter = 0;

  late List<String> gameWord;
  late Set<String> guessedLetters;
  late List<String> displayWord;

  Language language;
  DifficultyLevel difficulty;

  GameLogic(this.language, this.difficulty, String word) {
    gameWord = word.split('');
    guessedLetters = {};
    displayWord = List.filled(gameWord.length, '_');
  }

  bool guessLetter(String guessedLetter) {
    bool isCorrect = false;
    String icelandicToEnglishChar = '';
    if(language == Language.Icelandic){
      icelandicToEnglishChar = IcelandicToEnglish(guessedLetter)!.toLowerCase();
    }
    
    String lowerGuessedLetter = guessedLetter.toLowerCase();

    // Loops through the gameWord to check if the gameWord includes the guessed letter.
    // Loop also incorporates Icelandic characters and will show both kind of letters.
    // Example: User guesses character U. Loop checks both U and Ú
    for (int i = 0; i < gameWord.length; i++) {
      if (lowerGuessedLetter == gameWord[i].toLowerCase() || icelandicToEnglishChar == gameWord[i].toLowerCase()) {
        displayWord[i] = gameWord[i].toUpperCase();
        isCorrect = true;
      }
    }

    guessedLetters.add(lowerGuessedLetter);

    if(!isCorrect){
      wrongCounter++;
    }

    return isCorrect;
  }

  String getDisplayWord() {
    return displayWord.join(' ');
  }
}
