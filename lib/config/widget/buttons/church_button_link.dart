import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../utils/functions.dart';
import '../../values/values.dart';
import 'church_button.dart';

class ChurchButtonLink extends StatelessWidget {
  const ChurchButtonLink({
    Key? key,
    required this.buttonTitle,
    required this.url,
    this.linkTarget = LinkTarget.blank,
    this.buttonColor = AppColors.primaryColor,
    this.builder,
    this.width = Sizes.WIDTH_150,
    this.height = Sizes.HEIGHT_50,
    this.opensUrl = false,
  }) : super(key: key);

  final String url;
  final String buttonTitle;
  final LinkTarget linkTarget;
  final bool opensUrl;
  final Color buttonColor;
  final double? width;
  final double? height;
  final LinkWidgetBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      target: linkTarget,
      builder: (context, followLink) {
        return ChurchButton(
          width: width,
          height: height,
          buttonTitle: buttonTitle,
          buttonColor: buttonColor,

          onPressed: opensUrl==true ? (){
            openUrlLink(url);
          } : () {},
        );
      },
    );
  }
}
