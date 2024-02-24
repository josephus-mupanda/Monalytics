// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_this, constant_identifier_names

import 'package:flutter/material.dart';

enum ButtonType { PRIMARY, PLAIN }

class AppButton extends StatelessWidget {

  final ButtonType? type;
  final VoidCallback? onPressed;
  final String? text;

  AppButton({this.type, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: getButtonColor(context, type!),
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
              //color: Color.fromRGBO(169, 176, 185, 0.42),
              //spreadRadius: 0,
              //blurRadius: 3.0,
              //offset: Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Text(this.text!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: getTextColor(context, type!))),
        ),
      ),
    );
  }
}

Color getButtonColor(context, ButtonType type) {
  switch (type) {
    case ButtonType.PRIMARY:
      return Theme.of(context).hintColor;
    case ButtonType.PLAIN:
      return Colors.white;
    default:
      return Theme.of(context).primaryColor;
  }
}

Color getTextColor(context, ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return Theme.of(context).primaryColor;
    case ButtonType.PRIMARY:
      return Colors.white;
    default:
      return Theme.of(context).hintColor;
  }
}
