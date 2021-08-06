import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:romeu_portfolio/animations/bottom_animation.dart';
import 'package:romeu_portfolio/helper_widgets/custom_text_heading.dart';
import 'package:romeu_portfolio/pages/services_page/service_card.dart';

import '../../constants.dart';
import 'service_card_back.dart';

class Services extends StatelessWidget {
  Services({Key key}) : super(key: key);
  Widget child;
  double width;
  double height;
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(children: [
        CustomSectionHeading(text: "\nWhat I Do"),
        CustomSectionSubHeading(text: "Services provided!"),
        isMobile
            ? CarouselSlider.builder(
                //  cardWidth: width < 650 ? width * 0.8 : width * 0.5,
                itemCount: 5,
                itemBuilder: (BuildContext context, int itemIndex, int i) =>
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ServiceCardWrapper(
                          i: i,
                          maxWidth: 650,
                          maxWidthConstraint: 0.8,
                          minWidthConstraint: 0.5,
                          maxHeightConstraint: 0.8,
                          minHeightConstraint: 0.5,
                        )),
                options: CarouselOptions(
                    height: width < 450 ? height * 0.4 : height * 0.4,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    enableInfiniteScroll: false),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: WidgetAnimator(
                          child: ServiceCardWrapper(
                            i: index,
                            maxWidth: 1200,
                            maxWidthConstraint: 0.25,
                            minWidthConstraint: 0.22,
                            maxHeightConstraint: 0.37,
                            minHeightConstraint: 0.35,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     for (int index = 3;
                  //         index < kServicesIcons.length;
                  //         index++)
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //         child: WidgetAnimator(
                  //           child: ServiceCardWrapper(
                  //             i: index,
                  //             maxWidth: 1200,
                  //             maxWidthConstraint: 0.25,
                  //             minWidthConstraint: 0.22,
                  //             maxHeightConstraint: 0.37,
                  //             minHeightConstraint: 0.35,
                  //           ),
                  //         ),
                  //       )
                  //   ],
                  // ),
                ],
              )
      ]),
    );
  }

  ServiceCardWrapper(
      {@required int i,
      @required int maxWidth,
      @required double maxWidthConstraint,
      @required double minWidthConstraint,
      @required double maxHeightConstraint,
      @required double minHeightConstraint}) {
    return ServiceCard(
      cardWidth: width < maxWidth
          ? width * maxWidthConstraint
          : width * minWidthConstraint,
      cardHeight: width < maxWidth
          ? width * maxWidthConstraint
          : width * minWidthConstraint,
      serviceIcon: kServicesIcons[i],
      serviceTitle: kServicesTitles[i],
      serviceDescription: kServicesDescriptions[i],
      serviceLink: kServicesLinks[i],
      cardBack: ServiceCardBackWidget(
        serviceTitle: kServicesTitles[i],
        serviceDesc: kServicesDescriptions[i],
        height: height,
        width: width,
      ),
    );
  }
}
