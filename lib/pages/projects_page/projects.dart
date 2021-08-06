import 'package:flutter/material.dart';
// import 'package:particles_flutter/particles_flutter.dart';
import 'package:romeu_portfolio/pages/common/background_animation.dart';

class Projects extends StatelessWidget {
  const Projects({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: BackgroundAnimation(baseColor: Colors.blue)),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: double.maxFinite,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Projects',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
