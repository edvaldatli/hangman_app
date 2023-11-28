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
    ['Z', 'X', 'C', 'V', 'B', 'N', 'M', 'Þ', 'Ö'],
  ]
};

class OnScreenKeyboard extends StatefulWidget {
  final String language;
  final bool Function(String key) onKeyPress;

  const OnScreenKeyboard(
      {Key? key, required this.language, required this.onKeyPress})
      : super(key: key);

  @override
  OnScreenKeyboardState createState() => OnScreenKeyboardState();
}

class OnScreenKeyboardState extends State<OnScreenKeyboard> {
  
  Map<String, Color> keyColors = {};

  bool handleKeyPress(String key) {
    bool isCorrect = widget.onKeyPress.call(key);
    setState(() {
      keyColors[key] = isCorrect ? Colors.green : Colors.red;
    });
    return isCorrect;
  }

  @override
  Widget build(BuildContext context) {
    var layout = keyboardLayouts[widget.language];

    return layout != null
        ? Column(
            children: layout.map((row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: row.map((key) {
                  return Flexible(
                    child: KeyboardKey(
                      singleKey: key,
                      color: keyColors[key] ?? Colors.white10,
                      onKeyPress: handleKeyPress,
                    ),
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
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 4, 3, 3),
      child: ElevatedButton(
        onPressed: () {
          onKeyPress(singleKey);
        },
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
          backgroundColor: MaterialStatePropertyAll(color),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Text(singleKey),
      ),
    );
  }
}
