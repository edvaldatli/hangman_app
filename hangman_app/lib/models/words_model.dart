import 'dart:math';

import 'difficulties_model.dart';
import 'language_model.dart';

class Word {
  final String wordString;
  final DifficultyLevel level;
  final Language language;

  Word({required this.wordString, required this.level, required this.language});
}

class Words {
  final List<Word> wordList = [
    // Easy words
    Word(
        wordString: "apple",
        level: DifficultyLevel.Easy,
        language: Language.English),
    Word(
        wordString: "ball",
        level: DifficultyLevel.Easy,
        language: Language.English),
    Word(
        wordString: "cat",
        level: DifficultyLevel.Easy,
        language: Language.English),
    Word(
        wordString: "dog",
        level: DifficultyLevel.Easy,
        language: Language.English),
    Word(
        wordString: "egg",
        level: DifficultyLevel.Easy,
        language: Language.English),
    Word(
        wordString: "fish",
        level: DifficultyLevel.Easy,
        language: Language.English),
    Word(
        wordString: "giraffe",
        level: DifficultyLevel.Easy,
        language: Language.English),
    Word(
        wordString: "hat",
        level: DifficultyLevel.Easy,
        language: Language.English),
    Word(
        wordString: "ice",
        level: DifficultyLevel.Easy,
        language: Language.English),
    Word(
        wordString: "juice",
        level: DifficultyLevel.Easy,
        language: Language.English),

// Intermediate words
    Word(
        wordString: "mystery",
        level: DifficultyLevel.Intermediate,
        language: Language.English),
    Word(
        wordString: "knight",
        level: DifficultyLevel.Intermediate,
        language: Language.English),
    Word(
        wordString: "whisper",
        level: DifficultyLevel.Intermediate,
        language: Language.English),
    Word(
        wordString: "drought",
        level: DifficultyLevel.Intermediate,
        language: Language.English),
    Word(
        wordString: "harvest",
        level: DifficultyLevel.Intermediate,
        language: Language.English),
    Word(
        wordString: "pattern",
        level: DifficultyLevel.Intermediate,
        language: Language.English),
    Word(
        wordString: "voyage",
        level: DifficultyLevel.Intermediate,
        language: Language.English),
    Word(
        wordString: "wreath",
        level: DifficultyLevel.Intermediate,
        language: Language.English),
    Word(
        wordString: "journey",
        level: DifficultyLevel.Intermediate,
        language: Language.English),
    Word(
        wordString: "quartz",
        level: DifficultyLevel.Intermediate,
        language: Language.English),

// Hard words
    Word(
        wordString: "juxtaposition",
        level: DifficultyLevel.Hard,
        language: Language.English),
    Word(
        wordString: "kaleidoscope",
        level: DifficultyLevel.Hard,
        language: Language.English),
    Word(
        wordString: "quizzical",
        level: DifficultyLevel.Hard,
        language: Language.English),
    Word(
        wordString: "zephyr",
        level: DifficultyLevel.Hard,
        language: Language.English),
    Word(
        wordString: "rhythmic",
        level: DifficultyLevel.Hard,
        language: Language.English),
    Word(
        wordString: "xylophone",
        level: DifficultyLevel.Hard,
        language: Language.English),
    Word(
        wordString: "subjunctive",
        level: DifficultyLevel.Hard,
        language: Language.English),
    Word(
        wordString: "mnemonic",
        level: DifficultyLevel.Hard,
        language: Language.English),
    Word(
        wordString: "psyche",
        level: DifficultyLevel.Hard,
        language: Language.English),
    Word(
        wordString: "synecdoche",
        level: DifficultyLevel.Hard,
        language: Language.English),
  ];

  List<Word> getWordsByLanguageAndDifficulty(
      Language language, DifficultyLevel level) {
    return wordList
        .where((word) => word.language == language && word.level == level)
        .toList();
  }

  Word? getRandomWord(Language language, DifficultyLevel level) {
    var filteredWords = getWordsByLanguageAndDifficulty(language, level);
    if (filteredWords.isEmpty) {
      return null;
    }
    return filteredWords[Random().nextInt(filteredWords.length)];
  }
}

final words = Words();
