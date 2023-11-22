import 'package:flutter/material.dart';

final Map<String, List<List<String>>> keyboardLayouts = {
    'English': [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
    ],
    'Icelandic': [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'Ð'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Æ'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M', 'Þ']
    ]
  };

class OnScreenKeyboard extends StatefulWidget {
  final String language;
  final Function(String key) onKeyPress;

  OnScreenKeyboard({Key? key, required this.language, required this.onKeyPress})
      : super(key: key);

  @override
  OnScreenKeyboardState createState() => OnScreenKeyboardState();
}

class OnScreenKeyboardState extends State<OnScreenKeyboard> {
  // A map to keep track of key colors
  Map<String, Color> keyColors = {};

  void _handleKeyPress(String key) {
    // Call the onKeyPress method given by the parent widget,
    // which will return if the guess is correct or not.
    bool isCorrect = widget.onKeyPress(key);

    // Update the color of the key based on the guess.
    setState(() {
      keyColors[key] = isCorrect ? Colors.green : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    var layout = keyboardLayouts[widget.language];

    // Build the keyboard layout
    return layout != null
        ? Column(
            children: layout.map((row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: row.map((key) {
                  // Get the color for the current key, defaulting to grey if not yet pressed
                  return Flexible(
                    child: Container(
                      child: KeyboardKey(
                        singleKey: key,
                        color: keyColors[key] ?? Colors.grey,
                        onKeyPress: _handleKeyPress
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          )
        : Container(); // Return an empty container if the layout is not found
  }
}

class KeyboardKey extends StatelessWidget {
  final String singleKey;
  final Function(String) onKeyPress;
  final Color color;

  const KeyboardKey({
    Key? key,
    required this.singleKey,
    required this.onKeyPress,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onKeyPress(singleKey);
      },
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 0)),
        backgroundColor: MaterialStatePropertyAll(color),
      ),
      child: Text(singleKey),
    );
  }
}