enum DifficultyLevel{
  Easy,
  Intermediate,
  Hard
}

String getDescription(DifficultyLevel level){
  switch (level) {
    case DifficultyLevel.Easy:
      return "Kindergarden stuff";
    case DifficultyLevel.Intermediate:
      return "A bit challenging";
    case DifficultyLevel.Hard:
      return "Very challenging";
  }
}