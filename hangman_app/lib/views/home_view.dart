import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hangman_app/providers/game_settings.dart';

import 'package:hangman_app/views/hangman_view.dart';

import 'package:hangman_app/models/language_model.dart';
import 'package:hangman_app/models/difficulties_model.dart';

import 'package:hangman_app/widgets/shared/difficulty_modal.dart';
import 'package:hangman_app/widgets/shared/language_modal.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeViewState();
  const HomeView({
    super.key,
  });
}

class HomeViewState extends State<HomeView> {
  void onDifficultySelected(DifficultyLevel difficulty) {
    final gameSettings = Provider.of<GameSettingsModel>(context, listen: false);
    gameSettings.setDifficultyLevel(difficulty);
    Navigator.pop(context);
  }

  void onLanguageSelected(Language language) {
    final gameSettings = Provider.of<GameSettingsModel>(context, listen: false);
    gameSettings.setLanguage(language);
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
          const SizedBox(height: 5),
          ChangeLanguageButton(context)
        ],
      ),
    ));
  }

  FilledButton ChangeLanguageButton(BuildContext context) {
    final gameSettings = Provider.of<GameSettingsModel>(context);

    return FilledButton.tonal(
        onPressed: () => showLanguageModal(
            context, gameSettings.language, onLanguageSelected),
        child: (const Text('Change Language')));
  }

  FilledButton ChangeDifficultyButton(BuildContext context) {
    final gameSettings = Provider.of<GameSettingsModel>(context);

    return FilledButton.tonal(
      onPressed: () => showDifficultyModal(
          context, gameSettings.difficultyLevel, onDifficultySelected),
      child: const Text('Change Difficulty'),
    );
  }

  ElevatedButton StartButton() {
    final gameSettings = Provider.of<GameSettingsModel>(context);

    return ElevatedButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(40, 10, 40, 10)),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HangmanGameView()));
      },
      child: Column(
        children: [
          const Text(
            'Start!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(gameSettings.difficultyLevel.name),
          Text(gameSettings.language.name)
        ],
      ),
    );
  }
}
