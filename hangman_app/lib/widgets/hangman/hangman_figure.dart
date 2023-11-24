import 'package:flutter/material.dart';

class HangmanFigure extends StatelessWidget {
  final int lives;

  const HangmanFigure({super.key, required this.lives});

  @override
  Widget build(BuildContext context) {
    Widget hangknot(){
      return Image.asset('assets/images/hangknot.png', height: 100, color: Colors.white,);
    }
    List<Widget> bodyParts = [hangknot()];
    return bodyParts[0];

/*
    
    for (int i = 0; i < lives; i++) {
      Widget part;
      switch (i) {
        case 0:
          part = _buildHead();
          break;
        case 1:
          part = _buildBody();
          break;
        case 2:
          part = _buildLeftArm();
          break;
        case 3:
          part = _buildRightArm();
          break;
        case 4:
          part = _buildLeftLeg();
          break;
        case 5:
          part = _buildRightLeg();
          break;

        default:
          part = Container();
      }
      bodyParts.add(part);
    }

    return Column(
      children: bodyParts,
    );
  }
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
}