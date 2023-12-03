import 'package:flutter/material.dart';

import '../../Routes/routes_config.dart';
import '../button_withouticon_widget.dart';

class DetectorButton extends StatelessWidget {
  const DetectorButton(
      {super.key,
      required this.currentPage,
      required this.pageRoutes,
      required PageController controller,
      required this.disable})
      : _controller = controller;

  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController _controller;
  final bool disable;

  void handleOnTap(BuildContext context) {
    currentPage == 5
        ? Navigator.push(
            context, pageRoutes.menu.resultergonomic().route(context))
        : _controller.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTapTheme(
        onTap: () {
          if (!disable) {
            handleOnTap(context);
          }
        },
        text: "ถัดไป",
        radius: 32,
        width: double.infinity,
        height: 52,
        color: !disable
            ? Theme.of(context).colorScheme.primary
            : const Color(0xFF9BA4B5),
        borderSide: BorderSide.none,
        style: Theme.of(context).textTheme.headlineSmall);
  }
}
