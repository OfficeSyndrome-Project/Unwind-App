import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class StackImageWidget extends StatelessWidget {
  final List<String> listPath;
  final int currentIndex;
  const StackImageWidget(
      {super.key, required this.listPath, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetImage =
        List<int>.generate(listPath.length, (index) => index)
            .map((index) => RatioImageoneToOne(
                  assetName: listPath[index],
                  smallWidth: 320,
                  largeWidth: 380,
                  smallHeight: 320,
                  largeHeight: 380,
                  opacity: index == currentIndex ? 1.0 : 0.0,
                ))
            .toList();

    return Container(
        width: ResponsiveCheckWidget.isSmallMobile(context) ? 320 : 380,
        height: ResponsiveCheckWidget.isSmallMobile(context) ? 320 : 380,
        child: Stack(
          children: widgetImage,
        ));
  }
}
