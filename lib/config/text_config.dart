
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../responsive.dart';
import 'constants.dart';
import 'style/fonts.dart';
//import 'package:google_fonts/google_fonts.dart';


class BoldMainText extends StatelessWidget {

  final Color color;
  final String text;

  const BoldMainText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontFamily: Font.poppins,
          fontSize: Responsive.isDesktop(context) ?
          kDefaultPadding * 1.55
              :
          Responsive.isTablet(context) ?
          kDefaultPadding * 1.5
              :
          kDefaultPadding * 1.45
      ),
    );
  }
}

class MediumMainText extends StatelessWidget {

  final Color color;
  final String text;

  const MediumMainText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontFamily: Font.poppins,
          fontSize: Responsive.isDesktop(context) ?
          kDefaultPadding * 1.35
              :
          Responsive.isTablet(context) ?
          kDefaultPadding * 1.30
              :
          kDefaultPadding * 1.25
      ),
      textAlign: TextAlign.start,
    );
  }
}

class BoldText extends StatelessWidget {

  final Color color;
  final String text;

  const BoldText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontFamily: Font.poppins,
          fontSize: Responsive.isDesktop(context) ?
          kDefaultPadding * 0.95
              :
          Responsive.isTablet(context) ?
          kDefaultPadding * 0.9
              :
          kDefaultPadding * 0.85
      ),
    );
  }
}

class MediumTextPosts extends StatelessWidget {

  final Color color;
  final String text;

  const MediumTextPosts({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      maxLines: 2,
      //overflow: TextOverflow.clip,
      style:TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontFamily: Font.poppins,
          height: 1.5,
          // fontSize: Responsive.isDesktop(context) ?
          // kDefaultPadding * 0.8
          //     :
          // Responsive.isTablet(context) ?
          // kDefaultPadding * 0.7
          //     :
          // kDefaultPadding * 0.6
      ),
    );
  }
}


class MediumText extends StatelessWidget {

  final Color color;
  final String text;

  const MediumText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style:TextStyle(
        color: color,
        //fontWeight: FontWeight.w200,
        fontFamily: Font.poppins,
        /*fontSize: Responsive.isDesktop(context) ?
          kDefaultPadding * 0.8
              :
          Responsive.isTablet(context) ?
          kDefaultPadding * 0.7
              :
          kDefaultPadding * 0.6*/
      ),
      textAlign: TextAlign.center,
    );
  }
}


class SimpleText extends StatelessWidget {

  final Color color;
  final String text;

  const SimpleText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: TextStyle(
        color : color,
        //fontWeight: FontWeight.normal,
        fontFamily: Font.poppins,
        /*fontSize: Responsive.isDesktop(context) ?
          kDefaultPadding / 1.6
              :
          Responsive.isTablet(context) ?
          kDefaultPadding / 1.7
              :
          kDefaultPadding /1.8,*/
      ),
    );
  }
}

