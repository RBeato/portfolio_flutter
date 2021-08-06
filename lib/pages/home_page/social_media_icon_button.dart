import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class SocialMediaIconBtn extends StatelessWidget {
  final String iconPath;
  final String socialLink;
  final double height;
  final double horizontalPadding;

  SocialMediaIconBtn({
    @required this.iconPath,
    @required this.socialLink,
    @required this.height,
    @required this.horizontalPadding,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: GestureDetector(
        child: SvgPicture.asset(
          iconPath,
          color: Colors.white,
          height: height,
        ),
        onTap: () => launchURL(socialLink),
      ),
    );
  }
}
