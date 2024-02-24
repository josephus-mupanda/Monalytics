import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class ContainerSvgImage extends StatelessWidget {
  final String image;
  const ContainerSvgImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        constraints: const BoxConstraints(
          minWidth: 150,
          maxWidth: 300,
          minHeight: 150,
          maxHeight: 300,
        ),
        padding: const EdgeInsets.all(kDefaultPadding/2),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      );
  }
}