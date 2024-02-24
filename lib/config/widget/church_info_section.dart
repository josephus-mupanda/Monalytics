
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../layout/adaptive.dart';
import '../style/fonts.dart';
import '../values/values.dart';
import 'empty.dart';
import 'spaces.dart';


class ChurchInfoSection1 extends StatelessWidget {
  final String sectionTitle;
  final String title1;
  final String title2;
  final bool hasTitle2;
  final String body;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final int quarterTurns;
  final double dividerHeight;
  final Widget? child;

  const ChurchInfoSection1({
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.quarterTurns = 3,
    this.dividerColor = AppColors.grey250,
    this.dividerHeight = Sizes.HEIGHT_40,
    this.child,
    Key? key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? titleStyle = TextStyle(
      fontSize: responsiveSize(context, 22, 32, md: 28),
      fontFamily: Font.poppins,
      fontWeight: FontWeight.bold,
        color:  AppColors.kLightBlackColor.withOpacity(0.6),

    );
    double fontSize = responsiveSize(context, 6, 10);

    return Container(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: quarterTurns,
                  child: SelectableText(
                    sectionTitle,
                    style: textTheme.bodyText2?.copyWith(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey250,
                    ),
                  ),
                ),
                SpaceH16(),
                Container(
                  height: dividerHeight,
                  child: VerticalDivider(
                    color: dividerColor,
                    thickness: thickness,
                  ),
                ),
              ],
            ),
            SpaceW16(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    title1,
                    style: title1Style ?? titleStyle,
                  ),
                  SpaceH20(),

                  SelectableText(
                    body,
                    style: TextStyle(
                      fontFamily: Font.poppins,
                      height: 1.3,
                      color: AppColors.kLightBlackColor.withOpacity(0.6),
                    ),
                  ),
                  child != null ? SpaceH16() : Empty(),
                  child ?? Empty(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChurchInfoSection2 extends StatelessWidget {
  final String sectionTitle;
  final String title1;
  final String title2;
  final bool hasTitle2;
  final String body;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final double dividerWidth;
  final Widget? child;

  const ChurchInfoSection2({
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.dividerColor = AppColors.grey350,
    this.dividerWidth = Sizes.HEIGHT_64,
    this.child,
    Key? key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = TextStyle(
      fontSize: responsiveSize(context, 22, 32, md: 28),
      fontFamily: Font.poppins,
        fontWeight: FontWeight.bold,
      color: AppColors.kLightBlackColor.withOpacity(0.6),

    );
    double fontSize = responsiveSize(context, 10, 14);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: dividerWidth,
              child: Divider(
                color: dividerColor,
                thickness: thickness,
              ),
            ),
            SpaceW16(),
            SelectableText(
              sectionTitle,
              style: textTheme.bodyText2?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                color: AppColors.grey250,
                fontFamily: Font.poppins
              ),
            ),
          ],
        ),
        SpaceH16(),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              title1,
              style: title1Style ?? titleStyle,
            ),
            SpaceH20(),
            SelectableText(
              body,
              style: TextStyle(
                fontFamily: Font.poppins,
                height: 1.3,
                color:  AppColors.kLightBlackColor.withOpacity(0.6),
              ),
            ),
            child != null ? SpaceH30() : Empty(),
            child ?? Empty(),
          ],
        ),
      ],
    );
  }
}
