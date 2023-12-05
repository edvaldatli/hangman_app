import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hangman_app/providers/game_logic.dart';
import 'package:hangman_app/providers/game_settings.dart';

import 'package:hangman_app/views/home_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameSettingsModel()),
        ChangeNotifierProvider(create:(context) => GameLogicModel())
        ],
      child: WillPopScope(
        onWillPop: () async {
          return Future.value(false);
        },
        child: MaterialApp(
          title: 'Hangman',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}