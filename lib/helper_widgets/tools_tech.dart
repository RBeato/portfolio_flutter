import 'package:flutter/material.dart';

import '../adaptive_text.dart';

class ToolTechWidget extends StatelessWidget {
  final String techName;

  const ToolTechWidget({Key key, @required this.techName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 100.0,
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: Colors.white60,
            size: MediaQuery.of(context).size.height * 0.02,
          ),
          AdaptiveText(
            " $techName ",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
