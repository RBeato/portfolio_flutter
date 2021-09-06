import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/animations/bottom_animation.dart';
import 'package:romeu_portfolio/helper_widgets/custom_btn.dart';
import 'package:romeu_portfolio/pages/projects_page/project_card.dart';

import '../../constants.dart';

class ProjectsDesktop extends StatelessWidget {
  const ProjectsDesktop(this.sizingInfo);

  final SizingInformation sizingInfo;

  @override
  Widget build(BuildContext context) {
    Size size = sizingInfo.screenSize;
    return Column(
      children: [
        SizedBox(
          height: size.width > 1200 ? size.height * 0.45 : size.width * 0.35,
          child: ListView.separated(
            itemCount: 4,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return VerticalDivider(
                color: Colors.transparent,
                width: size.width * 0.015,
              );
            },
            itemBuilder: (context, index) {
              return WidgetAnimator(
                child: ProjectCard(index),
              );
            },
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        OutlinedCustomBtn(
            btnText: "See More",
            onPressed: () {
              launchURL("https://github.com/mhmzdev");
            })
      ],
    );
  }
}
