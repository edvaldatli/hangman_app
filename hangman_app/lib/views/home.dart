import 'package:flutter/material.dart';

class ChangeDifficultyView extends StatelessWidget{
  const ChangeDifficultyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/hangman_staur.png',
              height: 200,
            ),
            SizedBox(height: 40),
            Text(
              'Lets hang out!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(40, 10, 40, 10)),
              ),
              onPressed: () {

              },
              child: Text(
                'Let´s go!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 70,),
            FilledButton.tonal(
              onPressed: () {
                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(40),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text(
                            'Current difficulty',
                            style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline
                            ),
                          ),
                          Text(
                            '**Easy**',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                            ),
                          )
                        ],
                      ),
                    );
                  }
                );
              },
              child: Text('Change Difficulty'),
            ),
            Text('Current difficulty: Easy'),
          ],
        ),
      )
    );
  } 
}