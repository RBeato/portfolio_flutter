import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/helper_widgets/custom_text_heading.dart';
import 'package:romeu_portfolio/pages/services_page/services_desktop.dart';
import 'package:romeu_portfolio/pages/services_page/services_mobile.dart';
// import 'package:romeu_portfolio/pages/services_page/services_tablet.dart';

class Services extends StatelessWidget {
  Services({Key key}) : super(key: key);
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = sizingInformation.screenSize.height;
      double width = sizingInformation.screenSize.width;
      return Stack(children: [
        Align(child: Container(color: Colors.orange.withOpacity(0.5))),
        // Align(
        //     alignment: Alignment.center,
        //     child: BackgroundAnimation(baseColor: Colors.pink)),
        Align(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.04),
                child: Column(children: [
                  CustomSectionHeading(text: "\nWhat I Do"),
                  CustomSectionSubHeading(text: "Services provided!"),
                  SizedBox(
                    height: sizingInformation.screenSize.height * .07,
                  ),
                  sizingInformation.isMobile
                      ? ServicesMobile()
                      // : sizingInformation.isTablet
                      //     ? ServicesTablet()
                      : ServicesDesktop(sizingInformation)
                ]),
              ),
            ],
          ),
        ),
      ]);
    });
  }
}
