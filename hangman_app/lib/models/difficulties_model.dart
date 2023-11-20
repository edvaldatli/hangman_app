enum DifficultyLevel{
  Easy,
  Intermediate,
  Hard
}

class Difficulty {
  final DifficultyLevel level;
  final String description;
  Difficulty({required this.level, required this.description});

  static String _getDescription(DifficultyLevel level){
    switch (level) {
      case DifficultyLevel.Easy:
        return "Suitable for beginners";
      case DifficultyLevel.Intermediate:
        return "A bit challenging";
      case DifficultyLevel.Hard:
        return "Very challenging";
    }
  }
}