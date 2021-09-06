import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../adaptive_text.dart';
import '../../constants.dart';

class ProjectCard extends StatefulWidget {
  final int itemIndex;

  const ProjectCard(this.itemIndex);
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    String iconPath = kProjectsIcons[widget.itemIndex];
    String title = kProjectsTitles[widget.itemIndex];
    String description = kProjectsDescriptions[widget.itemIndex];
    String backImage = kProjectsBanner[widget.itemIndex];
    String projectLinks = kProjectsLinks[widget.itemIndex];

    return InkWell(
      onTap: () => launch(projectLinks),
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        double height = sizingInformation.localWidgetSize.height;
        double width = height * 1.8;
        return Container(
          width: height,
          height: width,
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.grey[500],
            border: Border(bottom: getorderSide(isHover)),
            boxShadow: getBoxShadow(isHover),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: EdgeInsets.all(height * 0.15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    getmainImage(
                      iconPath: iconPath,
                      width: width,
                      height: height,
                      title: title,
                    ),
                    (width > 1135 || width < 950)
                        ? AdaptiveText(
                            title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: height * 0.05,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[400],
                            ),
                          )
                        : Container(),
                    AdaptiveText(
                      description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: height * 0.03,
                          letterSpacing: 2.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          height: width >= 600 ? 2.0 : 1.2),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 400),
                opacity: isHover ? 0.0 : 1.0,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child:
                      backImage != null ? Image.asset(backImage) : Container(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  getBoxShadow(isHover) {
    return isHover
        ? [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 12.0,
              offset: Offset(0.0, 0.0),
            )
          ]
        : [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 12.0,
              offset: Offset(0.0, 0.0),
            )
          ];
  }

  getorderSide(isHover) {
    return isHover
        ? BorderSide(
            color: Colors.white,
            width: 3.0,
          )
        : BorderSide(
            color: Colors.grey[500],
          );
  }

  getmainImage({iconPath, width, height, title}) {
    return iconPath != null
        ? (width > 1135 || width < 950)
            ? Image.asset(
                iconPath,
                height: height * 0.2,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    iconPath,
                    height: height * 0.03,
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: height * 0.015,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
        : Container();
  }
}
