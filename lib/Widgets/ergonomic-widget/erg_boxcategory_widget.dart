import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_boxresult_widget.dart';
import 'package:unwind_app/data/ergonomic_model.dart';

class CategoryErgBoxWidget extends StatelessWidget {
  final int idCategory;
  final String type;
  final List<ErgonomicModel> questions;

  const CategoryErgBoxWidget({
    super.key,
    required this.idCategory,
    required this.type,
    required this.questions,
  });

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
          ListView.separated(
            shrinkWrap: true,
            itemCount: questions.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                ErgBoxresultWidget(question: questions[index]),
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
          ),
        ],
      ),
    );
  }
}
