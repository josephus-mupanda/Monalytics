import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/fonts.dart';

class AboutUsMenu extends StatefulWidget {
  const AboutUsMenu({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;

  @override
  State<AboutUsMenu> createState() => _AboutUsMenuState();
}

class _AboutUsMenuState extends State<AboutUsMenu> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: SelectableText(
          widget.title,
          style: TextStyle(
              fontFamily: Font.poppins,
              fontWeight: FontWeight.w600,
              color: isHover? AppColors.kGreenColor : AppColors.kLightBlackColor.withOpacity(0.6),
              fontSize: 16
          ),
        ),
      ),
    );
  }
}
