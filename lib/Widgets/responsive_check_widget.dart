import 'package:flutter/material.dart';

class ResponsiveCheckWidget extends StatelessWidget {
  final Widget smallMobile;
  final Widget mediumMobile;
  final Widget largeMobile;
  const ResponsiveCheckWidget(
      {super.key,
      required this.smallMobile,
      required this.mediumMobile,
      required this.largeMobile});

  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 375;
  static bool isMediumMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 481 &&
      MediaQuery.of(context).size.width >= 375;
  static bool isLargeMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768 &&
      MediaQuery.of(context).size.width >= 481;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 481) {
        return largeMobile;
      } else if (constraints.maxWidth >= 375) {
        return mediumMobile;
      } else {
        return smallMobile;
      }
    });
  }
}
