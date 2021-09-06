import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/pages/projects_page/project_card.dart';
import 'package:romeu_portfolio/pages/services_page/service_card.dart';

import '../../constants.dart';

class MobileCarouselSlider extends StatelessWidget {
  const MobileCarouselSlider({Key key, this.page, this.itemCount})
      : super(key: key);
  final Pages page;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return CarouselSlider.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: getWidget(page, i)),
        options: CarouselOptions(
            height: 400,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            enableInfiniteScroll: false),
      );
    });
  }
}

getCardSize(height) {
  if (height > 840) return height * 0.2;
  if (height > 500 && height < 840) return height * 0.5;
}

getWidget(Pages page, int itemIndex) {
  if (page == Pages.Services) {
    return ServiceCard(itemIndex);
  }
  if (page == Pages.Projects) {
    return ProjectCard(itemIndex);
  }
}
