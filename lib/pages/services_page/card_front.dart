import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/constants.dart';

class ServiceCardFront extends StatelessWidget {
  ServiceCardFront(this.cardIndex);
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double height = sizingInformation.localWidgetSize.height;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              kServicesIcons[cardIndex],
              height: height * 0.5,
            ),
            Text(
              kServicesTitles[cardIndex],
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: height * 0.07,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                // _themeProvider.lightTheme ? Colors.black : Colors.white,
              ),
            ),
            Text(
              kServicesTitles[cardIndex],
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: height * 0.03,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w200,
              ),
            )
          ],
        );
      },
    );
  }
}
