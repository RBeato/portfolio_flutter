import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlinedCustomBtn extends StatelessWidget {
  final String btnText;
  final Function onPressed;

  const OutlinedCustomBtn(
      {Key key, @required this.btnText, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.white38)),
      onPressed: () => onPressed,
      child: Text(
        btnText,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CustomFilledBtn extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final Function onPressed;
  final Color btnColor;
  const CustomFilledBtn(
      {Key key,
      @required this.height,
      @required this.btnColor,
      this.width = 200.0,
      @required this.onPressed,
      @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        color: btnColor,
        onPressed: () => onPressed,
        child: child,
      ),
    );
  }
}
