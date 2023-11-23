import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoadingAnimationWidget.inkDrop(
              color: Theme.of(context).colorScheme.primary, size: 200),
        ]);
  }
}
