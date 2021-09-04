import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/animations/bottom_animation.dart';
import 'package:romeu_portfolio/helper_widgets/custom_text_heading.dart';
import 'package:romeu_portfolio/pages/services_page/service_card.dart';
import '../../constants.dart';

class Services extends StatelessWidget {
  Services({Key key}) : super(key: key);
  double width;
  double height;
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Stack(children: [
        Align(child: Container(color: Colors.orange.withOpacity(0.5))),
        // Align(
        //     alignment: Alignment.center,
        //     child: BackgroundAnimation(baseColor: Colors.pink)),
        Align(
          child: Container(
            child: Column(children: [
              CustomSectionHeading(text: "\nWhat I Do"),
              CustomSectionSubHeading(text: "Services provided!"),
              sizingInformation.isMobile
                  ? Expanded(
                      child: CarouselSlider.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int i) =>
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: ServiceCard(i)),
                        options: CarouselOptions(
                            height: sizingInformation.screenSize.height > 500.0
                                ? sizingInformation.screenSize.height * 0.5
                                : 500.0,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            enlargeCenterPage: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            enableInfiniteScroll: false),
                      ),
                    )
                  : Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: WidgetAnimator(
                                    child: Container(color: Colors.green)

                                    // ServiceCard(index),
                                    ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (int index = 3;
                                  index < kServicesIcons.length;
                                  index++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: WidgetAnimator(
                                      child: Container(color: Colors.green)
                                      // ServiceCard(index),
                                      ),
                                )
                            ],
                          ),
                        ],
                      ),
                    )
            ]),
          ),
        ),
      ]);
    });
  }
}
