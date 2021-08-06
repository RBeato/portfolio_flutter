import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:romeu_portfolio/pages/services_page/custom_filled_button.dart';
import 'package:romeu_portfolio/pages/services_page/service_details.dart';

import '../../adaptive_text.dart';
import '../../constants.dart';

class ServiceCardBackWidget extends StatelessWidget {
  ServiceCardBackWidget(
      {@required this.height,
      @required this.width,
      @required this.serviceDesc,
      @required this.serviceTitle});

  // final ThemeProvider _themeProvider;
  final double height;
  final double width;
  final String serviceDesc;
  final String serviceTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AdaptiveText(
          serviceDesc,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: height * 0.015,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w400,
            height: width < 900 ? 1.5 : 1.8,
          ),
        ),
        const SizedBox(height: 25.0),
        MaterialButton(
          hoverColor: kPrimaryColor.withAlpha(150),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: kPrimaryColor)),
          onPressed: () {
            serviceTitle == kServicesTitles[3]
                ? launchURL(kServicesLinks[3])
                : serviceTitle == kServicesTitles[4]
                    ? launchURL(kServicesLinks[4])
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ServiceDetails(
                            serviceTitle: serviceTitle,
                            details: serviceDesc,
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
        const SizedBox(height: 10.0),
        Container(width: 250.0, height: 0.5, color: Colors.grey[400]
            // _themeProvider.lightTheme ? Colors.grey[400] : Colors.grey[100],
            ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 40.0,
          width: 150.0,
          child: MaterialButton(
            color: kPrimaryColor,
            onPressed: () => showDialog(
                context: context,
                builder: (contecxt) => AlertDialog(
                      backgroundColor: Colors.white,
                      //  _themeProvider.lightTheme
                      //     ? Colors.white
                      //     : Colors.grey[900],
                      title: AdaptiveText(
                        "Hire Me!",
                        style: const TextStyle(
                          fontSize: 32.0,
                          color: Colors.white,
                          // _themeProvider.lightTheme
                          //     ? Colors.black
                          //     : Colors.white),
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
    );
  }
}
