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

  const AppscreenTheme({
    super.key,
    this.textBar,
    this.textStyle,
    this.colorBar,
    this.iconButtonStart,
    this.iconButtonEnd,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                // child: SingleChildScrollView(
                //   physics: const BouncingScrollPhysics(),
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
