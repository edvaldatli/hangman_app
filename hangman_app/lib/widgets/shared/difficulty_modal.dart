import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hangman_app/models/difficulties_model.dart';

import 'package:hangman_app/providers/game_settings.dart';

// This widget opens and lets the user choose what difficulty it wants.
// It then returns the new difficulty to the passed function "onDifficultySelected" which is then handled inside home.dart.

void showDifficultyModal(BuildContext context, DifficultyLevel currentDifficulty, void Function(DifficultyLevel) onDifficultySelected) {
  final gameSettings = Provider.of<GameSettingsModel>(context, listen: false);


  // To check what difficulty is selected.
  // Currently used for highlighting the selected difficulty button in "Change Difficulty" selector
  bool checkDifficulty(DifficultyLevel currDiff, String selectedDiff){
    if(currDiff.name == selectedDiff){
      return true;
    }
    return false;
  }

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(40),
        height: 350,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Text(
              'Change Difficulty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline
              ),
            ),
            const SizedBox(height: 30),
            Flexible(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: DifficultyLevel.values.length,
                itemBuilder: (context, index) {
                  final difficulty = DifficultyLevel.values[index];
            
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: checkDifficulty(currentDifficulty, difficulty.name) ? const MaterialStatePropertyAll(Colors.green) : const MaterialStatePropertyAll(Colors.white),
                      ),
                      child: Column(
                        children: [
                          Text(
                            difficulty.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Text(
                              getDescription(difficulty),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        gameSettings.setDifficultyLevel(difficulty);
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    }
  );
}