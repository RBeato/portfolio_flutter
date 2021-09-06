import 'package:flutter/material.dart';
import 'package:romeu_portfolio/helper_widgets/custom_btn.dart';
import 'package:romeu_portfolio/pages/common/mobile_carousel_slider.dart';

import '../../constants.dart';

class ProjectsMobile extends StatelessWidget {
  const ProjectsMobile({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MobileCarouselSlider(
            itemCount: kProjectsBanner.length, page: Pages.Projects),
        SizedBox(height: height * 0.03),
        OutlinedCustomBtn(
            btnText: "See More",
            onPressed: () {
              launchURL("https://github.com/mhmzdev");
            })
      ],
    );
  }
}
