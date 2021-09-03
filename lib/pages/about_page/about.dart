import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final _communityLogoHeight = [40.0, 50.0, 20.0];

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(children: [
      Align(child: Container(color: Colors.green.withOpacity(0.5))),
      //     // alignment: Alignment.center,
      //     // child: BackgroundAnimation(baseColor: Colors.greenAccent)
      //     ),
      Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSectionHeading(text: "\nAbout Me"),
              ClipOval(
                child: Image.asset(
                  'assets/romeu.JPEG',
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                  // height: height * 0.27,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
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
                ),
              ),
              Text(
                "I'm Romeu Beato, biomedical engineer, fullstack developer and blockchain enthusiast",
                style: GoogleFonts.montserrat(
                  fontSize: height * 0.022,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                """At this point in time I work mainly with dart and flutter, so this allows me to build crossplatform applications while respecting each one's idiosyncrasies. I'm also into Blockchain technology so I've been spending an increasing amount of time learning an developing in this field. Despite my innate interest in science, I'm a logically oriented person who became a musician before turning into programming. I see myself as a problem solver with an artistic perspective on each challenge, with an uncanny but well-balanced blend of pragmatic and aesthetical considerations.""",
                style: GoogleFonts.montserrat(
                  fontSize: height * 0.018,
                  color: Colors.grey[500],
                  height: 1.5,
                ),
              ),
              Text(
                "Technologies I have worked with:",
                style: GoogleFonts.montserrat(
                    color: Colors.white24, fontSize: height * 0.015),
              ),
              Row(
                children: [
                  for (int i = 0; i < kTools.length; i++)
                    ToolTechWidget(
                      techName: kTools[i],
                    ),
                ],
              ),
            ],
          ))
    ]);
  }
}
