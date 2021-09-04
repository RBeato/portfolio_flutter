import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/pages/services_page/custom_filled_button.dart';
import 'package:romeu_portfolio/pages/services_page/service_details.dart';

import '../../adaptive_text.dart';
import '../../constants.dart';

class ServiceCardBack extends StatelessWidget {
  ServiceCardBack(this.cardIndex);
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double height = sizingInformation.localWidgetSize.height;
      return Padding(
        padding: EdgeInsets.all(sizingInformation.localWidgetSize.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AdaptiveText(
              kServicesDescriptions[cardIndex],
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: height * 0.05,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(150),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: kPrimaryColor)),
              onPressed: () {
                kServicesTitles[cardIndex] == kServicesTitles[3]
                    ? launchURL(kServicesLinks[3])
                    : kServicesTitles[cardIndex] == kServicesTitles[4]
                        ? launchURL(kServicesLinks[4])
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ServiceDetails(
                                serviceTitle: kServicesTitles[cardIndex],
                                details: kServicesDescriptions[cardIndex],
                              ),
                            ),
                          );
              },
              child: Text(
                "Details",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w300,
                  color: Colors
                      .white, //_themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
            ),
            Container(width: 250.0, height: 0.5, color: Colors.grey[400]),
            SizedBox(
              height: 40.0,
              width: 150.0,
              child: MaterialButton(
                color: kPrimaryColor,
                onPressed: () => showDialog(
                    context: context,
                    builder: (contecxt) => AlertDialog(
                          backgroundColor: Colors.grey[900],
                          title: AdaptiveText(
                            "Hire Me!",
                            style: const TextStyle(
                              fontSize: 32.0,
                              color: Colors.white,
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Back"))
                          ],
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomFilledBtn(
                                width: 200.0,
                                height: 40.0,
                                onPressed: () =>
                                    launchURL("https://wa.me/?text=Hi Hamza!"),
                                btnColor: Color(0xff34CB62),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(FontAwesomeIcons.whatsapp),
                                    const SizedBox(width: 8.0),
                                    Text("WhatsApp"),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              CustomFilledBtn(
                                width: 20.0,
                                height: 40.0,
                                onPressed: () => launchURL(
                                    "https://www.upwork.com/freelancers/~0197b0f6aaeba9675f"),
                                btnColor: const Color(0xff13A800),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      ".png",
                                      height: 35.0,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 8.0),
                                    const Text("Upwork"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                child: const Text(
                  "HIRE ME!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
