import 'package:hangman_app/models/language_model.dart';
import 'package:hangman_app/models/difficulties_model.dart';
import 'package:flutter/material.dart';

class GameSettingsModel with ChangeNotifier{
  DifficultyLevel _difficultyLevel = DifficultyLevel.Intermediate;
  Language _language = Language.Icelandic;

  DifficultyLevel get difficultyLevel => _difficultyLevel;
  Language get language => _language;

  void setDifficultyLevel(DifficultyLevel newDifficultyLevel){
    if(_difficultyLevel != newDifficultyLevel){
      _difficultyLevel = newDifficultyLevel;
      notifyListeners();
    }
  }

  void setLanguage(Language newLanguage){
    if(_language != newLanguage){
      _language = newLanguage;
      notifyListeners();
    }
  }
}