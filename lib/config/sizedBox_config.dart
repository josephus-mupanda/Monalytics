import 'package:flutter/material.dart';
import '../responsive.dart';
import 'constants.dart';

class SizedBoxContainer extends StatelessWidget {

  const SizedBoxContainer({
    Key? key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Responsive.isDesktop(context)?
          kDefaultPadding * 2
              :
          Responsive.isTablet(context)?
            kDefaultPadding * 1.5
                :
            kDefaultPadding * 1.2
    );
  }
}

class MediumSizedBoxContainer extends StatelessWidget {

  const MediumSizedBoxContainer ({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Responsive.isDesktop(context)?
        kDefaultPadding * 1.5
            :
        Responsive.isTablet(context)?
          kDefaultPadding * 1.2
              :
          kDefaultPadding * 1
    );
  }
}

class SimpleSizedBoxHeight extends StatelessWidget {

  const SimpleSizedBoxHeight ({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Responsive.isDesktop(context)?
        kDefaultPadding / 1.6
            :
        Responsive.isTablet(context)?
        kDefaultPadding / 2
            :
        kDefaultPadding / 2.5
    );
  }
}

class SimpleSizedBoxWidth extends StatelessWidget {

  const SimpleSizedBoxWidth ({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Responsive.isDesktop(context)?
        kDefaultPadding / 1.6
            :
        Responsive.isTablet(context)?
        kDefaultPadding / 2
            :
        kDefaultPadding / 2.5
    );
  }
}