import 'package:flutter/material.dart';

Map<String, List<List<String>>> keyboardLayouts = {
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

  OnScreenKeyboard({Key? key, required this.language}) : super(key: key);

  @override
  _OnScreenKeyboardState createState() => _OnScreenKeyboardState();
}

class _OnScreenKeyboardState extends State<OnScreenKeyboard> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the layout for the current language
    var layout = keyboardLayouts[widget.language];

    return layout != null
        ? Column(
            children: layout.map((row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: row.map((key) {
                  return KeyboardKey(
                      singleKey: key, onKeyPress: _handleKeyPress);
                }).toList(),
              );
            }).toList(),
          )
        : Container(); // Return an empty container if the layout is not found
  }

  void _handleKeyPress(String key) {
    // Handle the key press event
    print('Key pressed: $key');
  }
}

class KeyboardKey extends StatelessWidget {
  final String singleKey;
  final Function(String) onKeyPress;

  const KeyboardKey(
      {Key? key, required this.singleKey, required this.onKeyPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        padding: EdgeInsets.zero,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(0, 12, 0, 12)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          )),
          onPressed: () => onKeyPress(singleKey),
          child: Text(singleKey, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
