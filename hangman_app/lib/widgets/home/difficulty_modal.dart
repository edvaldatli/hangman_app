import 'package:flutter/material.dart';
import 'package:hangman_app/models/difficulties_model.dart';


void showDifficultyModal(BuildContext context, DifficultyLevel currentDifficulty, void Function(DifficultyLevel) onDifficultySelected) {

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
                decoration: TextDecoration.underline
              ),
            ),
            const SizedBox(height: 30),
            Flexible(
              child: ListView.builder(
                itemCount: DifficultyLevel.values.length,
                itemBuilder: (context, index) {
                  final difficulty = DifficultyLevel.values[index];
            
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: checkDifficulty(currentDifficulty, difficulty.name) ? const MaterialStatePropertyAll(Colors.green) : const MaterialStatePropertyAll(Colors.white),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            difficulty.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20
                            ),
                          ),
                          Text(
                            getDescription(difficulty),
                            style: const TextStyle(
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => onDifficultySelected(difficulty),
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