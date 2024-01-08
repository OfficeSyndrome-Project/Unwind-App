import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class ScreeningBoxWidget extends StatelessWidget {
  final String assetPath;
  final String titleLabel;
  final String descriptionLabel;

  const ScreeningBoxWidget(
      {super.key,
      required this.assetPath,
      required this.titleLabel,
      required this.descriptionLabel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 240,
              height: 240,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(assetPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              titleLabel,
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF484D56),
                    )
                  : Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              descriptionLabel,
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF636A75),
                    )
                  : Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
