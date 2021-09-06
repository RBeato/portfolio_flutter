import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:romeu_portfolio/pages/services_page/card_front.dart';
import 'package:romeu_portfolio/pages/services_page/card_back.dart';

import '../../constants.dart';

class ServiceCard extends StatefulWidget {
  ServiceCard(this.cardIndex);

  final int cardIndex;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        onHover: (isHovering) {
          if (isHovering) {
            setState(() {
              isHover = true;
            });
            cardKey.currentState.toggleCard();
          } else {
            setState(() {
              isHover = false;
            });
            cardKey.currentState.toggleCard();
          }
        },
        child: ResponsiveBuilder(builder: (context, sizingInformation) {
          return FlipCard(
            flipOnTouch: kIsWeb ? false : true,
            key: cardKey,
            back: FlippingCard(
                child: ServiceCardBack(widget.cardIndex), isHover: isHover),
            front: FlippingCard(
              isHover: isHover,
              child: ServiceCardFront(widget.cardIndex),
            ),
          );
        }));
  }
}

class FlippingCard extends StatelessWidget {
  FlippingCard({Key key, this.child, this.isHover}) : super(key: key);
  final Widget child;
  final bool isHover;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Container(
        height: getCardHeight(sizingInformation),
        width: getCardWidth(sizingInformation),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          border: Border(
            bottom: isHover
                ? BorderSide(
                    color: kPrimaryColor,
                    width: 3.0,
                  )
                : BorderSide(),
          ),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: kPrimaryColor.withAlpha(100),
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
                ],
        ),
        child: child,
      );
    });
  }
}

getCardHeight(SizingInformation sizingInformation) {
  double height = sizingInformation.screenSize.height * 0.4;
  if (sizingInformation.isMobile) {
    if (sizingInformation.screenSize.height > 700) height = 300;
  }
  if (sizingInformation.isTablet) {
    height = 230;
  }
  if (sizingInformation.isDesktop) {
    if (sizingInformation.screenSize.height > 700) height = 300;
  }
  return height;
}

getCardWidth(SizingInformation sizingInformation) {
  double screenWidth = sizingInformation.screenSize.width;
  double width = screenWidth * 0.27;
  if (sizingInformation.isMobile) {
    width = screenWidth * 0.65;
  }
  if (!sizingInformation.isTablet) {
    if (screenWidth > 940) width = screenWidth * 0.15;
    if (screenWidth > 700) width = screenWidth * 0.12;
  }
  if (sizingInformation.isDesktop) {
    if (screenWidth > 1500) width = screenWidth * 0.2;
    if (screenWidth > 1700) width = screenWidth * 0.15;
    if (screenWidth > 2200) width = screenWidth * 0.1;
  }
  return width;
}
