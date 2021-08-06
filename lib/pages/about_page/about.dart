import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:romeu_portfolio/helper_widgets/about_me_data.dart';
import 'package:romeu_portfolio/helper_widgets/community_icon_btn.dart';
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

    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: BackgroundAnimation(baseColor: Colors.greenAccent)),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            // color: Colors.white,
            child: Column(
              children: [
                CustomSectionHeading(text: "\nAbout Me"),
                // CustomSectionSubHeading(text: "Get to know me :)"),
                //TODO: make container round with borders
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/romeu.JPEG',
                    height: height * 0.27,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Who am I?",
                    style: GoogleFonts.montserrat(
                      color: Colors.white70,
                      fontSize: height * 0.025,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.028,
                ),
                Text(
                  "I'm Romeu Beato, biomedical engineer, fullstack developer and blockchain enthusiast",
                  style: GoogleFonts.montserrat(
                    fontSize: height * 0.022,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  """At this point in time I work mainly with dart and flutter, so this allows me to build crossplatform applications while respecting each one's idiosyncrasies. I'm also into Blockchain technology so I've been spending an increasing amount of time learning an developing in this field. Despite my innate interest in science, I'm a logically oriented person who became a musician before turning into programming. I see myself as a problem solver with an artistic perspective on each challenge, with an uncanny but well-balanced blend of pragmatic and aesthetical considerations.""",
                  style: GoogleFonts.montserrat(
                    fontSize: height * 0.018,
                    color: Colors.grey[500],
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black38, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Technologies I have worked with:",
                    style: GoogleFonts.montserrat(
                        color: Colors.white24, fontSize: height * 0.015),
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      ToolTechWidget(
                        techName: kTools[i],
                      ),
                  ],
                ),
                Row(
                  children: [
                    for (int i = 4; i < 8; i++)
                      ToolTechWidget(
                        techName: kTools[i],
                      ),
                  ],
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
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
                      Container(
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.black45, width: 2.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   children: [
                //     for (int i = 0; i < kCommunityLogo.length; i++)
                //       CommunityIconBtn(
                //         icon: kCommunityLogo[i],
                //         link: kCommunityLinks[i],
                //         height: _communityLogoHeight[i],
                //       ),
                //   ],
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
