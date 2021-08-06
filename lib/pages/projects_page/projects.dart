import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:romeu_portfolio/animations/bottom_animation.dart';
import 'package:romeu_portfolio/helper_widgets/custom_btn.dart';
import 'package:romeu_portfolio/helper_widgets/custom_text_heading.dart';
// import 'package:particles_flutter/particles_flutter.dart';
import 'package:romeu_portfolio/pages/common/background_animation.dart';

import '../../constants.dart';
import 'project_card.dart';

class Projects extends StatelessWidget {
  Projects({Key key}) : super(key: key);
  double width;
  double height;
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Stack(children: [
      Align(
          alignment: Alignment.center,
          child: BackgroundAnimation(baseColor: Colors.blue)),
      Align(
          alignment: Alignment.center,
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.02),
              child: Container(
                child: Column(
                  children: [
                    CustomSectionHeading(text: "\nPortfolio"),
                    CustomSectionSubHeading(
                        text:
                            "Here are few samples of my previous work :)\n\n"),
                    isMobile
                        ? Column(
                            children: [
                              CarouselSlider.builder(
                                itemCount: 10,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int i) =>
                                    Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: ProjectCardWrapper(i),
                                ),
                                options: CarouselOptions(
                                    height: height * 0.4,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 5),
                                    enlargeCenterPage: true,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    enableInfiniteScroll: false),
                              ),
                              SizedBox(height: height * 0.03),
                              OutlinedCustomBtn(
                                  btnText: "See More",
                                  onPressed: () {
                                    launchURL("https://github.com/mhmzdev");
                                  })
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height:
                                    width > 1200 ? height * 0.45 : width * 0.21,
                                child: ListView.separated(
                                  itemCount: 4,
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) {
                                    return VerticalDivider(
                                      color: Colors.transparent,
                                      width: width * 0.015,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return WidgetAnimator(
                                      child: ProjectCardWrapper(index),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              OutlinedCustomBtn(
                                  btnText: "See More",
                                  onPressed: () {
                                    launchURL("https://github.com/mhmzdev");
                                  })
                            ],
                          )
                  ],
                ),
              )))
    ]);
  }

  ProjectCard ProjectCardWrapper(int i) {
    double maxWidth;
    double maxWidthConstraint;
    double minWidthConstraint;
    if (isMobile) {
      maxWidth = 650;
      maxWidthConstraint = 0.8;
      minWidthConstraint = 0.4;
    } else {
      maxWidth = 1200;
      maxWidthConstraint = 0.35;
      minWidthConstraint = 0.3;
    }
    print("Width $width");
    return ProjectCard(
      cardWidth: width < maxWidth
          ? width * minWidthConstraint
          : width * maxWidthConstraint,
      cardHeight: width < maxWidth
          ? width * minWidthConstraint * 2
          : width * maxWidthConstraint * 2,
      backImage: kProjectsBanner[i],
      projectIcon: kProjectsIcons[i],
      projectTitle: kProjectsTitles[i],
      projectDescription: kProjectsDescriptions[i],
      projectLink: kProjectsLinks[i],
    );
  }
}
