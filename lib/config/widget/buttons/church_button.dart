
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import '../../layout/adaptive.dart';
import '../../style/fonts.dart';
import '../../values/values.dart';

class ChurchButton extends StatelessWidget {
  const ChurchButton({
    required this.buttonTitle,
    this.width = Sizes.WIDTH_150,
    this.height = Sizes.HEIGHT_50,
    this.titleStyle,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.black400,
    this.onPressed,
    this.padding = const EdgeInsets.all(Sizes.PADDING_8),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Sizes.RADIUS_4),
    ),
    this.opensUrl = false,
    this.url = "",
    this.linkTarget = LinkTarget.blank,
    Key? key,
  }):super(key: key);

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String buttonTitle;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color buttonColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry padding;
  final String url;
  final LinkTarget linkTarget;
  final bool opensUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius!,
      child: MaterialButton(
        minWidth: width,
        height: height,
        onPressed: opensUrl ? () {

        } : onPressed,
        color: buttonColor,
        child: Padding(
          padding: padding,
          child: buildChild(context),
        ),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double textSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_14,
      Sizes.TEXT_SIZE_16,
      md: Sizes.TEXT_SIZE_15,
    );
    if (opensUrl) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Link(
          uri: Uri.parse(url),
          target: linkTarget,
          builder: (context, followLink) {
            return GestureDetector(
              onTap: followLink,
              child: Text(
                buttonTitle,
                style: titleStyle ??
                    TextStyle(
                      color: titleColor,
                      fontSize: textSize,
                      fontFamily: Font.poppins,
                      // letterSpacing: 1.1,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            );
          },
        ),
      );
    } else {
      return Text(
        buttonTitle,
        style: titleStyle ??
            TextStyle(
              color: titleColor,
              fontSize: textSize,
              fontFamily: Font.poppins,
              // letterSpacing: 1.1,
              fontWeight: FontWeight.bold,
            ),
      );
    }
  }
}
