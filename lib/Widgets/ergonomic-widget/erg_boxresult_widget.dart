import 'package:flutter/material.dart';

class ResultErgBoxWidget extends StatelessWidget {
  final int idCategory;
  final String type;
  final String question;
  final String solution;
  final String prevent;
  const ResultErgBoxWidget(
      {Key? key,
      required this.idCategory,
      required this.type,
      required this.question,
      required this.solution,
      required this.prevent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ส่วนที่ $idCategory $type',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            question,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'คำแนะนำ :',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  solution,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'ป้องกัน :',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  prevent,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
