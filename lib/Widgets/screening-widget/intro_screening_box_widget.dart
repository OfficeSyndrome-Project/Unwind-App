import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ScreeningIntroToQuestionWidget extends StatelessWidget {
  final String assetPath;
  final String titleLabel;
  final String descriptionLabel;

  const ScreeningIntroToQuestionWidget(
      {super.key,
      required this.assetPath,
      required this.titleLabel,
      required this.descriptionLabel});
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: 32,
        ),
        AutoSizeText(
          titleLabel,
          style: Theme.of(context).textTheme.titleLarge,
          maxFontSize: 18,
          minFontSize: 16,
          maxLines: 1,
        ),
        const SizedBox(
          height: 8,
        ),
        AutoSizeText(
          descriptionLabel,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
          maxFontSize: 16,
          minFontSize: 12,
        ),
      ],
    );
  }
}
