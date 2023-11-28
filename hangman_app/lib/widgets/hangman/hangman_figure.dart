import 'package:flutter/material.dart';

class HangmanFigure extends StatelessWidget {
  final int lives;

  const HangmanFigure({super.key, required this.lives});

  Widget limbBuilder(BuildContext context, double top, double right,
      String image, double imgHeight) {
    return Positioned(
        top: top,
        right: MediaQuery.of(context).size.width / right,
        height: imgHeight,
        child: Image.asset(image));
  }

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
      return limbBuilder(
          context, 50, 2.7, 'assets/images/hangman_figure/head.png', 100);
    }

    Widget torso() {
      return limbBuilder(
          context, 88, 6, 'assets/images/hangman_figure/torso.png', 250);
    }

    Widget leftArm() {
      return limbBuilder(
          context, 88, 6.5, 'assets/images/hangman_figure/left_arm.png', 250);
    }

    Widget rightArm() {
      return limbBuilder(
          context, 85, 7, 'assets/images/hangman_figure/right_arm.png', 270);
    }

    Widget leftLeg() {
      return limbBuilder(
          context, 170, 6, 'assets/images/hangman_figure/left_leg.png', 250);
    }

    Widget rightLeg() {
      return limbBuilder(
          context, 170, 6, 'assets/images/hangman_figure/right_leg.png', 250);
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
