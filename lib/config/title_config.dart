// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:monalystics/config/values/values.dart';
import 'package:provider/provider.dart';
import '../responsive.dart';
import 'constants.dart';
import 'text_config.dart';


class SectionTitle extends StatelessWidget {

  final String title, subTitle;
  final Color color;

  const SectionTitle({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding/2,left: kDefaultPadding),
      constraints: BoxConstraints(maxWidth: kMaxWidth),
      height: Responsive.isDesktop(context)?
      kDefaultPadding * 4
          :
      Responsive.isTablet(context)?
      kDefaultPadding * 3.5
          :
      kDefaultPadding * 2.5,

      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            padding: EdgeInsets.only(
              bottom: Responsive.isDesktop(context)?
              kDefaultPadding * 2
                  :
              Responsive.isTablet(context)?
              kDefaultPadding * 1.6
                  :
              kDefaultPadding * 1.2,
            ),
            width: Responsive.isDesktop(context)?
            kDefaultPadding / 3
                :
            Responsive.isTablet(context)?
            kDefaultPadding / 3.5
                :
            kDefaultPadding / 4.5,

            height: Responsive.isDesktop(context)?
            kDefaultPadding * 3.2
                :
            Responsive.isTablet(context)?
            kDefaultPadding * 3.1
                :
            kDefaultPadding * 2.8,

            decoration: BoxDecoration(
              borderRadius:BorderRadius.only(
                  bottomLeft: Radius.circular(3.0),
                  bottomRight: Radius.circular(3.0),
                  topRight:  Radius.circular(3.0),
                  topLeft: Radius.circular(3.0)
              ),
              color:  AppColors.kLightBlackColor,
            ),

            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                borderRadius:BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: MediumText(
                  text: subTitle,
                  color: AppColors.kLightBlackColor,
                ),
              ),

              BoldText(
                text: title,
                color:  AppColors.kLightBlackColor,
              ),

            ],
          )
        ],
      ),
    );
  }
}

