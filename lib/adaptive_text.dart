import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  String text;
  TextStyle style;
  TextAlign textAlign;

  AdaptiveText(this.text, {@required this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? SelectableText(
            text,
            style: style,
            textAlign: textAlign,
          )
        : Text(
            text,
            style: style,
            textAlign: textAlign,
          );
  }
}
