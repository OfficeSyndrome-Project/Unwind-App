import 'package:flutter/material.dart';

Route animationRoute(Widget widgetRoutes) {
  return PageRouteBuilder(
    pageBuilder: ((context, animation, secondaryAnimation) => widgetRoutes),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.1, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
