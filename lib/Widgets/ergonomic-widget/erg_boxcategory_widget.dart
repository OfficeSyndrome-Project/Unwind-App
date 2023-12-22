import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ergonomic-widget/erg_boxresult_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/data/ergonomic-data/ergonomic_model.dart';

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
      decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
                color: Color(0xFF3B67CD),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)))),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text('ส่วนที่ $idCategory $type',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: questions.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  ErgBoxresultWidget(question: questions[index]),
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
