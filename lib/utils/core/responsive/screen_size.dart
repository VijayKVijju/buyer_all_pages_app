import 'package:flutter/widgets.dart';

class ScreenSize {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isSmall(BuildContext context) =>
      width(context) < 360;

  static bool isMedium(BuildContext context) =>
      width(context) >= 360 && width(context) < 480;

  static bool isLarge(BuildContext context) =>
      width(context) >= 480;
}
