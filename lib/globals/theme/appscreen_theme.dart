import 'package:flutter/material.dart';
import 'package:unwind_app/globals/theme/appbar_theme.dart';

class AppscreenTheme extends StatelessWidget {
  final String? textBar;
  final Color? colorBar;
  final TextStyle? textStyle;
  final IconButton? iconButtonStart;
  final IconButton? iconButtonEnd;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double? vertical;

  const AppscreenTheme({
    super.key,
    this.textBar,
    this.textStyle,
    this.colorBar,
    this.vertical,
    this.iconButtonStart,
    this.iconButtonEnd,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final double defaultVertical = 16;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppbarTheme(
              color: colorBar,
              text: textBar,
              style: textStyle,
              iconButtonStart: iconButtonStart,
              iconButtonEnd: iconButtonEnd,
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: vertical ?? defaultVertical,
                    bottom: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: children,
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
