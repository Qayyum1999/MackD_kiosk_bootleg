import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;
  final Widget mediumtabletBody;
  final Widget largetabletBody;

  ResponsiveLayout({
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
    required this.mediumtabletBody,
    required this.largetabletBody,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return mobileBody;
          } else if (constraints.maxWidth < 800) {
            return tabletBody;
          } else if (constraints.maxWidth < 1100) {
            return mediumtabletBody;
          } else if (constraints.maxWidth < 1450) {
            return largetabletBody;
          } else {
            return desktopBody;
          }
        },
      ),
    );
  }
}
