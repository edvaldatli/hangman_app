import 'package:flutter/material.dart';

class HangmanFigure extends StatelessWidget {
  final int lives;

  const HangmanFigure({super.key, required this.lives});

  @override
  Widget build(BuildContext context) {
    /*Widget hangknot(){
      return Positioned(
        top: 20,
        left: MediaQuery.of(context).size.width/2 - 50,
        child: Image.asset('assets/images/hangman_figure/hangknot.png', height: 100, color: Colors.white),
      );
    }*/
    Widget head() {
      return Positioned(
          top: 50,
          right: MediaQuery.of(context).size.width - 245,
          child: Image.asset('assets/images/hangman_figure/head.png',
              height: 100, color: Colors.white));
    }

    Widget torso() {
      return Positioned(
          top: 88,
          right: MediaQuery.of(context).size.width / 6,
          child: Image.asset(
            'assets/images/hangman_figure/torso.png',
            height: 250,
          ));
    }

    Widget leftArm() {
      return Positioned(
          top: 88,
          right: MediaQuery.of(context).size.width / 6 - 5,
          child: Image.asset('assets/images/hangman_figure/left_arm.png'),
          height: 250);
    }

    Widget rightArm() {
      return Positioned(
          top: 88,
          right: MediaQuery.of(context).size.width / 6 + 1,
          child: Image.asset('assets/images/hangman_figure/right_arm.png',
              height: 250));
    }

    Widget leftLeg() {
      return Positioned(
          top: 170,
          right: MediaQuery.of(context).size.width / 6,
          child: Image.asset(
            'assets/images/hangman_figure/left_leg.png',
            height: 250,
          ));
    }

    Widget rightLeg() {
      return Positioned(
          top: 170,
          right: MediaQuery.of(context).size.width / 6,
          child: Image.asset('assets/images/hangman_figure/right_leg.png'),
          height: 250);
    }

    List<Widget> bodyParts = [];

    if (lives > 0) {
      for (int i = 0; i < lives; i++) {
        Widget part;
        switch (i) {
          case 0:
            part = head();
            break;
          case 1:
            part = torso();
            break;
          case 2:
            part = leftArm();
            break;
          case 3:
            part = rightArm();
            break;
          case 4:
            part = leftLeg();
            break;
          case 5:
            part = rightLeg();
            break;
          default:
            part = Container();
        }
        bodyParts.add(part);
      }
    }

    return Column(
      children: [
        Expanded(
          child: Stack(children: bodyParts),
        ),
      ],
    );
  }
  /*
/*
  Widget _buildHead() {
    
  }

  Widget _buildBody() {
    // Build and return the body widget
  }

  Widget _buildLeftArm(){

  }

  Widget _buildRightArm(){

  }

  Widget _buildRightLeg(){

  }

  Widget _buildLeftLeg(){

  }*/*/
}
