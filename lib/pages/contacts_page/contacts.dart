import 'package:flutter/material.dart';
import 'package:romeu_portfolio/pages/common/background_animation.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(child: Container(color: Colors.blue.withOpacity(0.5))),
        // Align(
        //     alignment: Alignment.center,
        //     child: BackgroundAnimation(baseColor: Colors.orange)),
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
                      'Contacts',
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
