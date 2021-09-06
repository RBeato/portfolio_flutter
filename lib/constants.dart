import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum Pages { Home, Projects, Services, About, Contact }

var listOfTitles = ["Home", "Projects", "Services", "About", "Contact"];

var colors = [
  Colors.black,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow
];

// Colors
const Color kPrimaryColor = Color(0xffC0392B);

// Social Media
const kSocialIconsSvgsPaths = [
  "social_icons/linkedIn.svg",
  "social_icons/twitter.svg",
  "social_icons/github.svg",
  "social_icons/facebook.svg",
];

const kSocialLinks = [
  "https://www.linkedin.com/in/romeu-beato-62620b56/",
  "https://twitter.com/BeatoRomeu",
  "https://github.com/RBeato",
  "https://www.facebook.com/romeu.beato/",
];

// Social Media
// const kSocialIcons = [
//   "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
//   "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
//   "https://img.icons8.com/android/480/ffffff/twitter.png",
//   "https://img.icons8.com/metro/308/ffffff/linkedin.png",
//   "https://img.icons8.com/material-rounded/384/ffffff/github.png",
//   "https://img.icons8.com/ios-filled/500/ffffff/medium-monogram--v1.png"
// ];

// URL Launcher
void launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

// Community
final kCommunityLogo = [
  'assets/cui.png',
  'assets/flutterIsl.png',
  'assets/dsc.png'
];

final kCommunityLinks = [
  "https://www.comsats.edu.pk/",
  "https://web.facebook.com/FlutterIslamabadPakistan/",
  "https://dsc.community.dev/comsats-university-islamabad/"
];

// Tools & Tech
final kTools = [
  "Flutter",
  "Dart",
  "Python",
  "C++",
  "HTML",
  "CSS",
  "Bootstrap",
  "Solidity"
];

// SERVICES
final kServicesIcons = [
  "assets/services/app.png",
  "assets/services/ui.png",
  "assets/services/rapid.png",
  "assets/services/blog.png",
  "assets/services/open.png",
];

final kServicesTitles = [
  "Full App Development",
  "UI/UX Designing",
  "Rapid Prototyping",
  "Technical Blog Writing",
  "Open Source - GitHub",
];

final kServicesDescriptions = [
  "Android app development via Flutter\n- Splash Screen\n- Firebase Auth/Cloud\n- REST APIs\n- Maps integration and more...!",
  "Modern UI/UX Designing\n- Adobe XD\n- Mobile & Web designs\n- Interactive UI designs\n- Responsiveness\n- Promo Videos and more..!",
  "Rapid Prototype via Flutter\n- Working MVP\n- Quick & Working prototype",
  "Technical Blog writing\n- Medium blogs\n- Soothing header images\n- SEO friendly\n- Researched topics and more..!",
  "Open source GitHub Projects\n- Awesome README.md\n- Well documented\n- Header images and more...!",
];

final kServicesLinks = [
  "https://www.fiverr.com/hamza6shakeel/be-your-mobile-app-developer-via-flutter",
  "https://www.fiverr.com/hamza6shakeel/get-you-modern-ui-design-using-adobe-xd",
  "https://www.fiverr.com/hamza6shakeel/be-your-mobile-app-developer-via-flutter",
  "https://mhamzadev.medium.com",
  "https://github.com/mhmzdev"
];

// PROJECTS
final kProjectsBanner = [
  "assets/projects/medkitB.png",
  "assets/projects/quranB.png",
  "assets/projects/hereiamB.png",
  "assets/projects/covidB.png",
];

final kProjectsIcons = [
  "assets/projects/medkit.png",
  "assets/projects/quran.png",
  "assets/projects/hereiam.png",
  "assets/projects/covid.png",
];

final kProjectsTitles = [
  "MedKit",
  "The Holy Qur'an",
  "Here I Am",
  "COVID-19",
];

final kProjectsDescriptions = [
  "A Phramacy app developed using Flutter powered with Firebase as database with Doctor and Patient panels.",
  "Application of Holy book of Muslims, Al-Qur'an. Developed using Flutter. Powered with live RestAPI given in README.md",
  "Here I am is an Alert app that Sends alert SMS holding your location (Address and Google Maps) to your loved ones.",
  "A live trakcer for COVID19 stats across the Globe and my Home country Pakistan. It uses APIs so the data is live.",
];

final kProjectsLinks = [
  "https://github.com/mhmzdev/MedKit-Pharmacy-App-Using-Flutter",
  "https://github.com/mhmzdev/The_Holy_Quran_App",
  "https://github.com/mhmzdev/Here-I-Am-Alert-App",
  "https://github.com/mhmzdev/Covid19-Tracker-App",
];

// CONTACT
final kContactIcons = [
  Icons.home,
  Icons.phone,
  Icons.mail,
];

final kContactTitles = [
  "Location",
  "Phone",
  "Email",
];

final kContactDetails = [
  "Attock, Pakistan",
  "(+92) 346 0159889",
  "hamza@mhmz.dev"
];
