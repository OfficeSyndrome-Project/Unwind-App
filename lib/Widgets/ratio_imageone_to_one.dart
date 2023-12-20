import 'package:flutter/material.dart';

import 'responsive_check_widget.dart';

class RatioImageoneToOne extends StatelessWidget {
  final String assetName;
  const RatioImageoneToOne({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveCheckWidget.isSmallMobile(context) ? 200 : 250,
      height: ResponsiveCheckWidget.isSmallMobile(context) ? 200 : 250,
      margin: EdgeInsets.only(top: 24, bottom: 8),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          width: ResponsiveCheckWidget.isSmallMobile(context) ? 200 : 250,
          height: ResponsiveCheckWidget.isSmallMobile(context) ? 200 : 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetName),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
