import 'dart:convert';
import 'package:http/http.dart' as http;

class WordService{
  Future<String> fetchWord(String language, String difficulty) async {
    final response = await http.get(Uri.parse("https://hangman.edvaldatli.com/api/${language.toLowerCase()}/${difficulty.toLowerCase()}"));

    if (response.statusCode == 200){
      final String word = jsonDecode(response.body);
      return word.toLowerCase();
    } else {
      return '';
    }
  }
}