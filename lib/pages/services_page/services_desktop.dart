import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/animations/bottom_animation.dart';
import 'package:romeu_portfolio/pages/services_page/service_card.dart';

import '../../constants.dart';

class ServicesDesktop extends StatelessWidget {
  const ServicesDesktop(this.sizingInfo);

  final SizingInformation sizingInfo;

  @override
  Widget build(BuildContext context) {
    Size size = sizingInfo.screenSize;
    return Column(
      children: [
        SizedBox(
          height: size.height *
              0.7, // > 1200 ? size.height * 0.4 : size.width * 0.35,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: 10.0,
              spacing: 10.0,
              alignment: WrapAlignment.center,
              children: List.generate(
                kServicesIcons.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: WidgetAnimator(
                    child: ServiceCard(index),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
