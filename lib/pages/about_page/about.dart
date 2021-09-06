import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/animations/bottom_animation.dart';
import 'package:romeu_portfolio/helper_widgets/custom_btn.dart';
import 'package:romeu_portfolio/helper_widgets/custom_text_heading.dart';
import 'package:romeu_portfolio/helper_widgets/tools_tech.dart';
import 'package:universal_html/html.dart' as html;

import '../../constants.dart';
import '../common/background_animation.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = sizingInformation.screenSize.height;
      double width = sizingInformation.screenSize.width;
      return Stack(children: [
        Align(child: Container(color: Colors.green.withOpacity(0.5))),
        //     // alignment: Alignment.center,
        //     // child: BackgroundAnimation(baseColor: Colors.greenAccent)
        //     ),
        Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.all(width * 0.06),
                child: ListView(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomSectionHeading(text: "About Me"),
                          smallSpacer(height),
                          AboutImage(sizingInformation),
                          AboutQuestionAndResumeRow(height: height),
                          desktopSpacer(sizingInformation),
                          SmallDescription(height: height),
                          desktopSpacer(sizingInformation),
                          BigAboutDescription(height: height),
                          smallSpacer(height),
                          Text(
                            "Technologies I have worked with:",
                            style: GoogleFonts.montserrat(
                                color: Colors.white24,
                                fontSize: height * 0.015),
                          ),
                          TechnologiesList(height: height)
                        ]),
                  ],
                )))
      ]);
    });
  }

  SizedBox smallSpacer(double height) {
    return SizedBox(
      height: height * 0.03,
    );
  }

  desktopSpacer(SizingInformation sizingInformation) {
    return !sizingInformation.isTablet
        ? SizedBox(
            height: sizingInformation.screenSize.height * 0.01,
          )
        : Container();
  }
}

class AboutImage extends StatelessWidget {
  AboutImage(this.sizingInformation);
  SizingInformation sizingInformation;

  @override
  Widget build(BuildContext context) {
    double imageSize = getImageSize();
    return ClipOval(
      child: Image.asset(
        'assets/romeu.JPEG',
        height: imageSize,
        width: imageSize,
        fit: BoxFit.cover,
        // height: height * 0.27,
      ),
    );
  }

  getImageSize() {
    if (sizingInformation.isMobile) return 170.0;
    if (sizingInformation.isTablet) return 200.0;
    if (sizingInformation.isDesktop) return 260.0;
  }
}

class TechnologiesList extends StatelessWidget {
  const TechnologiesList({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
          height:
              height * 0.1, // > 1200 ? size.height * 0.4 : size.width * 0.35,
          child: Wrap(
              direction: Axis.horizontal,
              runSpacing: 2.0,
              spacing: 2,
              alignment: WrapAlignment.center,
              children: List.generate(
                  kTools.length,
                  (i) => WidgetAnimator(
                        child: ToolTechWidget(
                          techName: kTools[i],
                        ),
                      )))),
    );
  }
}

class BigAboutDescription extends StatelessWidget {
  const BigAboutDescription({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      """At this point in time I work mainly with dart and flutter, so this allows me to build crossplatform applications while respecting each one's idiosyncrasies. I'm also into Blockchain technology so I've been spending an increasing amount of time learning an developing in this field. Despite my innate interest in science, I'm a logically oriented person who became a musician before turning into programming. I see myself as a problem solver with an artistic perspective on each challenge, with an uncanny but well-balanced blend of pragmatic and aesthetical considerations.""",
      style: GoogleFonts.montserrat(
        fontSize: height * 0.018,
        color: Colors.grey[500],
        height: 1.5,
      ),
      minFontSize: 14.0,
      textAlign: TextAlign.justify,
    );
  }
}

class SmallDescription extends StatelessWidget {
  const SmallDescription({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "I'm Romeu Beato, biomedical engineer, fullstack developer and blockchain enthusiast",
      style: GoogleFonts.montserrat(
        fontSize: height * 0.022,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      minFontSize: 15.0,
      textAlign: TextAlign.justify,
    );
  }
}

class AboutQuestionAndResumeRow extends StatelessWidget {
  const AboutQuestionAndResumeRow({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Who am I?",
          style: GoogleFonts.montserrat(
            color: Colors.white70,
            fontSize: height * 0.025,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedCustomBtn(
              btnText: "Resume",
              onPressed: () {
                kIsWeb
                    ? html.window.open(
                        'https://drive.google.com/uc?export=view&id=1OOdcdGEN3thVvpZ4cl_MM0LT-GCMuLIE',
                        "pdf")
                    : launchURL(
                        'https://drive.google.com/uc?export=view&id=1OOdcdGEN3thVvpZ4cl_MM0LT-GCMuLIE');
              }),
        ),
      ],
    );
  }
}
