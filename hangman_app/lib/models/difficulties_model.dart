enum DifficultyLevel{
  Easy,
  Intermediate,
  Hard
}

String getDescription(DifficultyLevel level){
  switch (level) {
    case DifficultyLevel.Easy:
      return "Suitable for beginners";
    case DifficultyLevel.Intermediate:
      return "A bit challenging";
    case DifficultyLevel.Hard:
      return "Very challenging";
  }
}