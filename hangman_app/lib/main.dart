import 'package:flutter/material.dart';
import 'package:hangman_app/models/language_model.dart';
import 'package:hangman_app/views/home.dart';
import 'package:hangman_app/models/difficulties_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      home: HomeView(initialDifficulty: DifficultyLevel.Intermediate, initialLanguage: Language.Icelandic)
    );
  }
}