import 'package:flutter/material.dart';

//ใช้เทสเฉยๆ
class TestWidget extends StatefulWidget {
  final String title;
  final String assetPath;
  // final int currentPage;
  // final PageRoutes pageRoutes;
  // final PageController controller;
  const TestWidget({
    Key? key,
    required this.title,
    required this.assetPath,
    // required this.currentPage,
    // required this.controller,
    // required this.pageRoutes
  }) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(widget.assetPath),
      Text(widget.title),
    ]);
  }
}

class TestWidget2 extends StatelessWidget {
  final String title;
  const TestWidget2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
