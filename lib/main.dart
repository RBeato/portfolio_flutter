import 'package:flutter/material.dart';
import 'package:romeu_portfolio/pages/about_page/about.dart';

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
  var list = ["Home", "Projects", "Services", "About", "Contact"];
  var colors = [
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow
  ];

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
            children: <Widget>[
              Spacer(),
              Row(
                children: List.generate(pages.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      _scrollToIndex(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.1)),
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        list[index],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
          // Pages
          Expanded(
            child: PageView(
                scrollDirection: Axis.vertical,
                pageSnapping: false,
                controller: controller,
                children: [Projects()]
                //pages,
                ),
          ),
        ],
      )),
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index,
        duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}
