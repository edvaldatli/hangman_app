import 'dart:convert';
import 'package:http/http.dart' as http;

class Word{
  Future<String> fetchWord(String language, String difficulty) async {
    final response = await http.get(Uri.parse("http://164.90.193.79:3000/hangman/$language/$difficulty"));

    if (response.statusCode == 200){
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String word = data['word'];
      return word.toLowerCase();
    } else {
      return '';
    }
  }
}