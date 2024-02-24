// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:monalystics/config/values/values.dart';
import 'package:monalystics/config/widget/container_widget.dart';

import 'style/fonts.dart';
//const kPrimaryColor = Color(0xFFE8F0F9);//Color(0xFFFF3B1D);
//const kDarkBlackColor = Color(0xFF191919);
const kBgColor = Color(0xFFE7E7E7);
const kBodyTextColor = Color(0xFF666666);

const kDefaultPadding = 20.0;
const kMaxWidth = 1300.0; //1232.0;
const kDefaultDuration = Duration(milliseconds: 250);

class MyDialog extends StatelessWidget {
  final String title;
  final String content;
  final String nameYes;
  final String nameNo;
  final VoidCallback ok;

  const MyDialog({
    required this.title,
    required this.content,
    required this.nameYes,
    required this.nameNo,
    required this.ok,

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor:AppColors.lightSecondaryColor ,
        title: Center(
          child: Column(
            children: [
              Icon(Icons.warning_outlined,
                  size: 36, color: Colors.red),
              SizedBox(height: kDefaultPadding / 2),
              Text(title,
                style: TextStyle(
                  fontFamily:  Font.poppins,
                  color: AppColors.kLightBlackColor,
                ),
              ),
            ],
          ),
        ),
        content: Container(
          color:  AppColors
              .lightSecondaryColor,
          height: 110,
          child: Column(
            children: [
              Text(
                content,
                style: TextStyle(
                  fontFamily:  Font.poppins,
                  color: AppColors.kLightBlackColor,
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerWithOutBorder(
                    text: nameNo,
                    color: AppColors.white,
                    press: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  ContainerWithBorder(
                      text: nameYes,
                      color: Colors.redAccent,
                      press: ok
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
