import 'package:flutter/material.dart';
import 'package:hangman_app/models/difficulties_model.dart';
import 'package:hangman_app/views/hangman.dart';
import 'package:hangman_app/widgets/home/difficulty_modal.dart';
import 'package:hangman_app/models/language_model.dart';
import 'package:hangman_app/widgets/home/language_modal.dart';

class HomeView extends StatefulWidget {
  final DifficultyLevel initialDifficulty;
  final Language initialLanguage;

  @override
  State<StatefulWidget> createState() => HomeViewState();
  HomeView({required this.initialDifficulty, required this.initialLanguage});
}

class HomeViewState extends State<HomeView> {
  late DifficultyLevel currentDifficulty;
  late Language currentLanguage;

  void initState() {
    super.initState();
    currentDifficulty = widget.initialDifficulty;
    currentLanguage = widget.initialLanguage;
  }

  void onDifficultySelected(DifficultyLevel difficulty) {
    setState(() {
      currentDifficulty = difficulty;
    });
    Navigator.pop(context);
  }

  void onLanguageSelected(Language language) {
    setState(() {
      currentLanguage = language;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/hangman_staur.png',
            height: 200,
          ),
          const SizedBox(height: 40),
          const Text(
            'Lets hang out!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          StartButton(),
          const SizedBox(height: 20),
          ChangeDifficultyButton(context),
          SizedBox(height: 5),
          ChangeLanguageButton(context)
        ],
      ),
    ));
  }

  FilledButton ChangeLanguageButton(BuildContext context) {
    return FilledButton.tonal(
        onPressed: () =>
            showLanguageModal(context, currentLanguage, onLanguageSelected),
        child: (const Text('Change Language')));
  }

  FilledButton ChangeDifficultyButton(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () =>
          showDifficultyModal(context, currentDifficulty, onDifficultySelected),
      child: const Text('Change Difficulty'),
    );
  }

  ElevatedButton StartButton() {
    return ElevatedButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(40, 10, 40, 10)),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HangmanView(language: currentLanguage)));
      },
      child: Column(
        children: [
          const Text(
            'Start!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(currentDifficulty.name),
          Text(currentLanguage.name)
        ],
      ),
    );
  }
}
