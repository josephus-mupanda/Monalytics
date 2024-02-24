import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/style/fonts.dart';
import '../../../config/values/values.dart';

class PageRightSide extends StatelessWidget {
  final String title;
  final String icon;
  const PageRightSide({
    required this.title,
    required this.icon,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: const BoxDecoration(
          ),
          child: Center(
            child: SizedBox(
              height: 500,
              child: Stack(
                children: [
                  SvgPicture .asset(
                    icon,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        //color: Colors.white, //withOpacity(.3),
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          title,
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: Font.poppins,
                            fontSize: 20,
                            color:  AppColors.kLightBlackColor,
                          ) ,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 60,
                      width: 60,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 30,top: 100),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color:AppColors.kThemeYellow, //Colors.white
                      ),
                      child: const Text("🤞",
                        style:TextStyle(
                          fontFamily: Font.poppins,
                          color: AppColors.white,
                          fontSize:  24
                      ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 30,top: 300),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:AppColors.kThemeYellow, //Colors.white
                    ),
                    child: const Text("🖐",
                      style: TextStyle(
                        fontFamily: Font.poppins,
                          color: AppColors.white,
                        fontSize:  24
                    ),),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
