import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/pages/about_page/about.dart';

import 'constants.dart';
import 'pages/contacts_page/contacts.dart';
import 'pages/home_page/home.dart';
import 'pages/projects_page/projects.dart';
import 'pages/services_page/services.dart';

void main() {
  runApp(const MyApp());
}

//TODO: If mobile center options in appbar

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Romeu Beato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Widget> pages = [
    Home(),
    Projects(),
    Services(),
    About(),
    Contacts(),
  ];

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor:
          Colors.black, // _themeProv.lightTheme ? Colors.white : Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(pages.length, (index) {
              return GestureDetector(
                onTap: () {
                  _scrollToIndex(index);
                },
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.transparent.withOpacity(0.1)),
                  margin: const EdgeInsets.all(8),
                  child: Text(
                    listOfTitles[index],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
          ),
          // Pages
          Expanded(
            child: ResponsiveBuilder(builder: (context, sizingInformation) {
              print(
                  "Screen Size: ${sizingInformation.screenSize} Device Type${sizingInformation.deviceScreenType} isPortrait:${sizingInformation.screenSize.aspectRatio < 1}");
              return PageView(
                  scrollDirection: Axis.vertical,
                  pageSnapping: false,
                  controller: controller,
                  children: [
                    Services(),
                    Projects(),
                  ]
                  //pages,
                  );
            }),
          )
        ],
      )),
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index,
        duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}
