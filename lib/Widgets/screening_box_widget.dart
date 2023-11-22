import 'package:flutter/material.dart';

class ScreeningBoxWidget extends StatelessWidget {
  final String assetPath;
  final String titleLabel;
  final String descriptionLabel;

  const ScreeningBoxWidget({Key? key,
  required this.assetPath,
  required this.titleLabel,
  required this.descriptionLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 240,
          height: 240,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage(assetPath),
                  fit: BoxFit.fill,
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
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          descriptionLabel,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
