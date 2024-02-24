// import 'package:flutter/material.dart';
// import 'package:layout/layout.dart';
//
// enum DisplayType {
//   desktop,
//   mobile,
// }
//
// const _desktopPortraitBreakpoint = 700.0;
// const _desktopLandscapeBreakpoint = 1000.0;
// const _ipadProBreakpoint = 1000.0;
//
// /// Returns the [DisplayType] for the current screen. This app only supports
// /// mobile and desktop layouts, and as such we only have one breakpoint.
// DisplayType displayTypeOf(BuildContext context) {
//   final orientation = MediaQuery.of(context).orientation;
//   final width = MediaQuery.of(context).size.width;
//
//   if ((orientation == Orientation.landscape &&
//           width > _desktopLandscapeBreakpoint) ||
//       (orientation == Orientation.portrait &&
//           width > _desktopPortraitBreakpoint)) {
//     return DisplayType.desktop;
//   } else {
//     return DisplayType.mobile;
//   }
// }
//
// /// Returns a boolean if we are in a display of [DisplayType.desktop]. Used to
// /// build adaptive and responsive layouts.
// bool isDisplayDesktop(BuildContext context) {
//   return displayTypeOf(context) == DisplayType.desktop;
// }
//
// /// Returns a boolean if we are in a display of [DisplayType.desktop] but less
// /// than [_desktopLandscapeBreakpoint] width. Used to build adaptive and responsive layouts.
// bool isDisplaySmallDesktop(BuildContext context) {
//   return isDisplayDesktop(context) &&
//       MediaQuery.of(context).size.width < _desktopLandscapeBreakpoint;
// }
//
// bool isDisplaySmallDesktopOrIpadPro(BuildContext context) {
//   return isDisplaySmallDesktop(context) ||
//       (MediaQuery.of(context).size.width > _ipadProBreakpoint &&
//           MediaQuery.of(context).size.width < 1170);
// }
//
// double widthOfScreen(BuildContext context) {
//   return MediaQuery.of(context).size.width;
// }
//
// double heightOfScreen(BuildContext context) {
//   return MediaQuery.of(context).size.height;
// }
//
// double assignHeight(
//   BuildContext context,
//   double fraction, {
//   double additions = 0.0,
//   double subs = 0.0,
// }) {
//   return (heightOfScreen(context) - (subs) + (additions)) * fraction;
// }
//
// double assignWidth(
//   BuildContext context,
//   double fraction, {
//   double additions = 0,
//   double subs = 0,
// }) {
//   return (widthOfScreen(context) - (subs) + (additions)) * fraction;
// }
//
// double responsiveSize(
//   BuildContext context,
//   double xs,
//   double lg, {
//   double? sm,
//   double? md,
//   double? xl,
// }) {
//   return context.layout.value(
//     xs: xs,
//     sm: sm ?? (md ?? xs), //assign md to sm if it is not null, if null assign xs
//     md: md ?? lg,
//     lg: lg,
//     xl: xl ?? lg,
//   );
// }
//
// int responsiveSizeInt(
//   BuildContext context,
//   int xs,
//   int lg, {
//   int? sm,
//   int? md,
//   int? xl,
// }) {
//   return context.layout.value(
//     xs: xs,
//     sm: sm ?? (md ?? xs), //assign md to sm if it is not null, if null assign xs
//     md: md ?? lg,
//     lg: lg,
//     xl: xl ?? lg,
//   );
// }
//
// Color responsiveColor(
//   BuildContext context,
//   Color xs,
//   Color lg, {
//   Color? sm,
//   Color? md,
//   Color? xl,
// }) {
//   return context.layout.value(
//     xs: xs,
//     sm: sm ?? (md ?? xs), //assign md to sm if it is not null, if null assign xs
//     md: md ?? lg,
//     lg: lg,
//     xl: xl ?? lg,
//   );
// }
//
// double getSidePadding(BuildContext context) {
//   double sidePadding = assignWidth(context, 0.05);
//   return responsiveSize(context, 30, sidePadding, md: sidePadding);
// }

import 'package:flutter/material.dart';

enum DisplayType {
  desktop,
  mobile,
}

const _desktopPortraitBreakpoint = 700.0;
const _desktopLandscapeBreakpoint = 1000.0;
const _ipadProBreakpoint = 1000.0;

double widthOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heightOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool isDisplayDesktop(BuildContext context) {
  final width = widthOfScreen(context);
  return width > _desktopPortraitBreakpoint;
}

bool isDisplaySmallDesktop(BuildContext context) {
  final width = widthOfScreen(context);
  return isDisplayDesktop(context) && width < _desktopLandscapeBreakpoint;
}

bool isDisplaySmallDesktopOrIpadPro(BuildContext context) {
  final width = widthOfScreen(context);
  return isDisplaySmallDesktop(context) ||
      (width > _ipadProBreakpoint && width < 1170);
}

double assignHeight(
    BuildContext context,
    double fraction, {
      double additions = 0.0,
      double subs = 0.0,
    }) {
  final height = heightOfScreen(context);
  return (height - subs + additions) * fraction;
}

double assignWidth(
    BuildContext context,
    double fraction, {
      double additions = 0,
      double subs = 0,
    }) {
  final width = widthOfScreen(context);
  return (width - subs + additions) * fraction;
}

double responsiveSize(
    BuildContext context,
    double xs,
    double lg, {
      double? sm,
      double? md,
      double? xl,
    }) {
  final width = widthOfScreen(context);
  if (width >= 1200) {
    return xl ?? lg;
  } else if (width >= 992) {
    return lg;
  } else if (width >= 768) {
    return md ?? lg;
  } else if (width >= 576) {
    return sm ?? (md ?? xs);
  } else {
    return xs;
  }
}

int responsiveSizeInt(
    BuildContext context,
    int xs,
    int lg, {
      int? sm,
      int? md,
      int? xl,
    }) {
  final width = widthOfScreen(context);
  if (width >= 1200) {
    return xl ?? lg;
  } else if (width >= 992) {
    return lg;
  } else if (width >= 768) {
    return md ?? lg;
  } else if (width >= 576) {
    return sm ?? (md ?? xs);
  } else {
    return xs;
  }
}

Color responsiveColor(
    BuildContext context,
    Color xs,
    Color lg, {
      Color? sm,
      Color? md,
      Color? xl,
    }) {
  final width = widthOfScreen(context);
  if (width >= 1200) {
    return xl ?? lg;
  } else if (width >= 992) {
    return lg;
  } else if (width >= 768) {
    return md ?? lg;
  } else if (width >= 576) {
    return sm ?? (md ?? xs);
  } else {
    return xs;
  }
}

double getSidePadding(BuildContext context) {
  double sidePadding = assignWidth(context, 0.05);
  return responsiveSize(context, 30, sidePadding, md: sidePadding);
}


