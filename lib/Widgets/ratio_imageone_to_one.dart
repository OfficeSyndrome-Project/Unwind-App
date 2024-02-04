import 'package:flutter/material.dart';

import 'responsive_check_widget.dart';

class RatioImageoneToOne extends StatelessWidget {
  final String assetName;
  final double smallWidth;
  final double largeWidth;
  final double smallHeight;
  final double largeHeight;
  final double? opacity;
  RatioImageoneToOne(
      {super.key,
      required this.assetName,
      required this.smallWidth,
      required this.largeWidth,
      required this.smallHeight,
      required this.largeHeight,
      this.opacity});

  @override
  Widget build(BuildContext context) {
    double ratioSmallWidth = smallWidth;
    double ratioSmallHeight = smallHeight;
    double ratioLargeWidth = largeWidth;
    double ratioLargeHeight = largeHeight;
    double _opacity = opacity ?? 1.0;
    return Container(
      width: ResponsiveCheckWidget.isSmallMobile(context)
          ? smallWidth
          : largeWidth,
      height: ResponsiveCheckWidget.isSmallMobile(context)
          ? smallHeight
          : largeHeight,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          width: ResponsiveCheckWidget.isSmallMobile(context)
              ? ratioSmallWidth
              : ratioLargeWidth,
          height: ResponsiveCheckWidget.isSmallMobile(context)
              ? ratioSmallHeight
              : ratioLargeHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetName),
              fit: BoxFit.contain,
              opacity: _opacity,
            ),
          ),
        ),
      ),
    );
  }
}
