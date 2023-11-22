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
  final Function(String, bool) onKeyPress;

  OnScreenKeyboard({Key? key, required this.language, required this.onKeyPress})
      : super(key: key);

  @override
  OnScreenKeyboardState createState() => OnScreenKeyboardState();
}

class OnScreenKeyboardState extends State<OnScreenKeyboard> {
  Map<String, Color> keyColors = {};

  void updateKeyColor(String key, bool isCorrect) {
    setState(() {
      keyColors[key] = isCorrect ? Colors.green : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    var layout = keyboardLayouts[widget.language]; // Assume this is defined
    return layout != null
        ? Column(
            children: layout.map((row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: row.map((key) {
                  return KeyboardKey(
                    singleKey: key,
                    onKeyPress: (String pressedKey) {
                      bool isCorrect = widget.onKeyPress(pressedKey);
                      updateKeyColor(pressedKey, isCorrect);
                    },
                    color: keyColors[key] ?? Colors.grey,
                  );
                }).toList(),
              );
            }).toList(),
          )
        : Container();
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
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onKeyPress(singleKey),
      style: ElevatedButton.styleFrom(primary: color),
      child: Text(singleKey),
    );
  }
}