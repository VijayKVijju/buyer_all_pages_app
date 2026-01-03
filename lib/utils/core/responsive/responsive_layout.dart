import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget small;
  final Widget medium;
  final Widget large;

  const ResponsiveLayout({
    Key? key,
    required this.small,
    required this.medium,
    required this.large,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 360) {
      return small;
    } else if (width < 480) {
      return medium;
    } else {
      return large;
    }
  }
}
