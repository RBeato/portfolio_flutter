import 'package:flutter/material.dart';
import 'package:romeu_portfolio/pages/common/mobile_carousel_slider.dart';

import '../../constants.dart';

class ServicesMobile extends StatelessWidget {
  const ServicesMobile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileCarouselSlider(
      itemCount: kServicesTitles.length,
      page: Pages.Services,
    );
  }
}
