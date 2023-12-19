import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';

//ใช้เทสเฉยๆ
class TestWidget extends StatefulWidget {
  final String title;
  final String assetPath;
  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController controller;
  const TestWidget(
      {Key? key,
      required this.title,
      required this.assetPath,
      required this.currentPage,
      required this.controller,
      required this.pageRoutes})
      : super(key: key);

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
  final List<String> question;
  const TestWidget2({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("คำถาม"),
        // for (var i = 0; i < question.length; i++)
        //   Text(question[i]),
      ],
    );
  }
}
