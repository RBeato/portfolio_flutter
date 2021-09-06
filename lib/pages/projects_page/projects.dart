import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/helper_widgets/custom_text_heading.dart';
import 'package:romeu_portfolio/pages/projects_page/projects_desktop.dart';
import 'package:romeu_portfolio/pages/projects_page/projects_mobile.dart';
import 'package:romeu_portfolio/pages/projects_page/projects_tablet.dart';
// import 'package:particles_flutter/particles_flutter.dart';

class Projects extends StatelessWidget {
  Projects({Key key}) : super(key: key);
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = sizingInformation.screenSize.height;
      double width = sizingInformation.screenSize.width;
      return Stack(children: [
        Align(child: Container(color: Colors.purple.withOpacity(0.5))),
        // Align(
        //     alignment: Alignment.center,
        //     child: BackgroundAnimation(baseColor: Colors.blue)),
        Align(
            alignment: Alignment.center,
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04, vertical: height * 0.04),
                    child: Column(
                      children: [
                        CustomSectionHeading(text: "Projects"),
                        CustomSectionSubHeading(
                            text:
                                "Here are few samples of my previous work :)\n\n"),
                        SizedBox(
                          height: sizingInformation.screenSize.height * .07,
                        ),
                        sizingInformation.isMobile
                            ? ProjectsMobile(height: height)
                            : sizingInformation.isTablet
                                ? ProjectsTablet(sizingInformation)
                                : ProjectsDesktop(sizingInformation),
                      ],
                    )),
              ],
            ))
      ]);
    });
  }
}
