import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../utils/functions.dart';

class ChurchLink extends StatelessWidget {
  const ChurchLink({
    Key? key,
    required this.url,
    required this.child,
    this.linkTarget = LinkTarget.blank,
    this.builder,
  }) : super(key: key);
  final String url;
  final Widget child;
  final LinkTarget linkTarget;
  final LinkWidgetBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      target: linkTarget,
      builder: (context, followLink) {
        return InkWell(
          //onTap: () => followLink,
          onTap:(){
            openUrlLink(url);
          },
          child: child,

        );
      },
    );
  }
}
