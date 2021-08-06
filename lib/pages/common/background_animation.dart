import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';
// import 'package:particles_flutter/particles_flutter.dart';

class BackgroundAnimation extends StatelessWidget {
  BackgroundAnimation({Key key, @required this.baseColor}) : super(key: key);
  Color baseColor;
  double opacity = 0.2;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        key: UniqueKey(),
        child: Center(
          //     child: Container(
          //   color: Colors.black,
          // )
          child: CircularParticle(
            // key: UniqueKey(),
            awayRadius: 20,
            numberOfParticles: 7,
            speedOfParticles: 0.2,
            height: screenHeight,
            width: screenWidth,
            onTapAnimation: true,
            particleColor: Colors.white30.withOpacity(opacity),
            awayAnimationDuration: const Duration(milliseconds: 600),
            maxParticleSize: 80,
            isRandSize: true,
            isRandomColor: true,
            randColorList: [
              baseColor.withOpacity(opacity),
            ],
            awayAnimationCurve: Curves.easeInOutBack,
            enableHover: true,
            hoverColor:
                baseColor.withOpacity(opacity > 0.8 ? opacity + 0.2 : 1),
            hoverRadius: 180,
            connectDots: true,
          ),
        ),
      ),
    );
  }
}
