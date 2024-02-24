// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../values/values.dart';

class SocialIconFooter extends StatefulWidget {
  const SocialIconFooter({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback press;

  @override
  State<SocialIconFooter> createState() => _SocialIconFooterState();
}

class _SocialIconFooterState extends State<SocialIconFooter> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value){
        setState((){
          isHover = value;
        });
      },
      child: Container(
        height: 35,
        width: 35,
        //padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.darkSecondaryColor,
          shape: BoxShape.circle,
          //borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
            child: Icon(
              widget.icon,
              size: 20,
              color: isHover? AppColors.kGreenColor : AppColors.kLightBlackColor.withOpacity(0.6),
            )
        ),
      ),
    );
  }
}


class SocialIcon extends StatefulWidget {
  const SocialIcon({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback press;

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.press,
      onHover: (value){
        setState((){
          isHover = value;
        });
      },
      child: Container(
        height: 35,
        width: 35,
        //padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color:  AppColors.lightSecondaryColor,
          shape: BoxShape.circle,
          //borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
            child: Icon(
              widget.icon,
              size: 20,
              color: isHover? AppColors.kGreenColor : AppColors.kLightBlackColor.withOpacity(0.6),
            )
        ),
      ),
    );
  }
}