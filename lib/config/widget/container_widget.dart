import 'package:flutter/material.dart';
import '../../responsive.dart';
import '../text_config.dart';

class ContainerWithBorder extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback press;

  const ContainerWithBorder({
    Key? key,
    required this.text,
    required this.color,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(40.0/(Responsive.isDesktop(context) ? 1 : 2)),
        ),
        //color: Colors.white,
        padding: EdgeInsets.all(0.0),
      ),
      onPressed: press,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0 /(Responsive.isDesktop(context) ? 1 : 2)),
          border: Border.all(color:  color,),
          //color: Colors.transparent, //AppColors.kBgColor,
        ),
        child: MediumText(
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ContainerWithOutBorder extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback press;

  const ContainerWithOutBorder({
    Key? key,
    required this.text,
    required this.color,
    required this.press,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40/(Responsive.isDesktop(context) ? 1 : 2)),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(0.0),
      ),
      onPressed: press,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            color:Theme.of(context).primaryColor,
          ),
        ),
        child: MediumText(
          text: text,
          color: color,
        ),
      ),
    );
  }
}
