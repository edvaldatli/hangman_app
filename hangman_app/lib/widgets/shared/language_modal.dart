import 'package:flutter/material.dart';
import 'package:hangman_app/models/language_model.dart';

void showLanguageModal(BuildContext context, Language currentLanguage, void Function(Language) onLanguageSelected) {

  bool checkLanguage(Language currLanguage, String selectedLanguage){
    if(currLanguage.name == selectedLanguage){
      return true;
    }
    return false;
  }

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(40),
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Text(
              'Change Language',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: TextDecoration.underline
              ),
            ),
            const SizedBox(height: 30),
            Flexible(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: Language.values.length,
                itemBuilder: (context, index) {
                  final language = Language.values[index];
                  return ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(100, 40)),
                      backgroundColor: checkLanguage(currentLanguage, language.name) ? const MaterialStatePropertyAll(Colors.green) : const MaterialStatePropertyAll(Colors.white),
                    ),
                    child: Text(
                      language.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),
                    ),
                    onPressed: () => onLanguageSelected(language),
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