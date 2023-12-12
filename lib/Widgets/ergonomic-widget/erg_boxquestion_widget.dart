import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/radio_widget.dart';

class QuestionEegonomicWidget extends StatelessWidget {
  final String question;
  final String imagePath;
  final Function(bool) onCurrentOptionsChanged;
  final Map<int, bool?> currentOptions;
  final int index;

  const QuestionEegonomicWidget({
    super.key,
    required this.question,
    required this.imagePath,
    required this.onCurrentOptionsChanged,
    required this.currentOptions,
    required this.index,
  });

  Widget radioWidget(BuildContext context, Map<int, bool?>? currentOptions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedCustomRadio(
            value: currentOptions != null && currentOptions.containsKey(index)
                ? currentOptions[index] ?? false
                : false,
            groupValue: true,
            onChanged: (value) {
              onCurrentOptionsChanged(true);
            },
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Theme.of(context).colorScheme.primary),
        AutoSizeText(
          'ใช่',
          style: Theme.of(context).textTheme.bodyLarge,
          maxFontSize: 16,
          minFontSize: 14,
        ),
        const SizedBox(
          width: 16,
        ),
        AnimatedCustomRadio(
            value: !(currentOptions != null && currentOptions.containsKey(index)
                ? currentOptions[index] ?? true
                : true),
            groupValue: true,
            onChanged: (value) {
              onCurrentOptionsChanged(false);
            },
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Theme.of(context).colorScheme.primary),
        AutoSizeText(
          'ไม่',
          style: Theme.of(context).textTheme.bodyLarge,
          maxFontSize: 16,
          minFontSize: 14,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 166,
            height: 90,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                width: 166,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 280,
            child: AutoSizeText(
              question,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.clip,
              maxFontSize: 16,
              minFontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          radioWidget(context, currentOptions),
        ],
      ),
    );
  }
}
