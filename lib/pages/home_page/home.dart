import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/particles_flutter.dart';
// import 'package:particles_flutter/particles_flutter.dart';
import 'package:romeu_portfolio/adaptive_text.dart';
import 'package:romeu_portfolio/animations/bottom_animation.dart';

import '../../constants.dart';
import '../../entrance_fader.dart';
import 'social_media_icon_button.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> animatedSentences = width > 500
        ? [
            " Mobile, Web and Desktop development",
            " Blockchain Development",
            " Biomedical Engineering"
          ]
        : [
            " Mobile, Web and \n Desktop development",
            " Blockchain Development",
            " Biomedical Engineering"
          ];
    // final _themeProvider = Provider.of<ThemeProvider>(context);
    var textList =
        animatedSentences.map((i) => animatedText(i, height)).toList();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double opacity = 0.4;

    return Stack(
      children: [
        Align(child: Container(color: Colors.yellow.withOpacity(0.5))),
        // Align(
        //   alignment: Alignment.center,
        //   child: Center(
        //     child: Container(
        //       key: UniqueKey(),
        //       child: Center(
        //         child: CircularParticle(
        //           // key: UniqueKey(),
        //           awayRadius: 20,
        //           numberOfParticles: 120,
        //           speedOfParticles: 0.10,
        //           height: screenHeight,
        //           width: screenWidth,
        //           onTapAnimation: true,
        //           particleColor: Colors.white30.withOpacity(opacity),
        //           awayAnimationDuration: Duration(milliseconds: 600),
        //           maxParticleSize: 12,
        //           isRandSize: true,
        //           isRandomColor: true,
        //           randColorList: [
        //             Colors.blue.withOpacity(opacity),
        //             Colors.grey.withOpacity(opacity),
        //             Colors.white.withOpacity(opacity),
        //           ],
        //           awayAnimationCurve: Curves.easeInOutBack,
        //           enableHover: true,
        //           hoverColor: Colors.white,
        //           hoverRadius: 90,
        //           connectDots: true, //not recommended
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: double.maxFinite,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: [
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.yellow, //kPrimaryColor,
                            ),
                            FittedBox(
                              child: AnimatedTextKit(
                                totalRepeatCount: 999,
                                animatedTexts: animatedSentences
                                    .map((i) => animatedText(i, height))
                                    .toList(),
                                isRepeatingAnimation: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        WidgetAnimator(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AdaptiveText(
                                "Romeu",
                                style: GoogleFonts.montserrat(
                                    fontSize: width < 1200
                                        ? height * 0.015
                                        : height * 0.025,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                    // _themeProvider.lightTheme
                                    //     ? Colors.black
                                    //     : Colors.white,
                                    letterSpacing: 4.0),
                              ),
                              AdaptiveText(
                                "Beato",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    // _themeProvider.lightTheme
                                    //     ? Colors.black
                                    //     : Colors.white,
                                    fontSize: width < 1200
                                        ? height * 0.015
                                        : height * 0.025,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 5.0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            kSocialIconsSvgsPaths.length,
                            (index) => WidgetAnimator(
                              child: SocialMediaIconBtn(
                                iconPath: kSocialIconsSvgsPaths[index],
                                socialLink: kSocialLinks[index],
                                height: height * 0.030,
                                horizontalPadding: width * 0.015,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  AnimatedText animatedText(String text, double screenHeight) {
    return TypewriterAnimatedText(
      text,
      textStyle: TextStyle(
          fontSize: screenHeight * 0.03 > 32.0 ? screenHeight * 0.03 : 32.0,
          fontWeight: FontWeight.bold,
          color: Colors.white

          // _themeProvider.lightTheme
          //     ? Colors.black
          //     : Colors.white,
          ),
      speed: const Duration(milliseconds: 50),
    );
  }
}
