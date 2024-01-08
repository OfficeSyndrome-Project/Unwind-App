import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class TypepainContainer extends StatelessWidget {
  final void Function()? onTap;
  final bool isSelect;
  final String typePain;
  final String assetName;
  const TypepainContainer(
      {super.key,
      this.onTap,
      required this.isSelect,
      required this.typePain,
      required this.assetName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: isSelect ? Color(0xFF3B67CD) : Color(0xFFD7DAE1),
                  width: isSelect ? 2 : 1,
                  strokeAlign: 1.0)),
          color: isSelect ? Color(0xFFC4D1F0) : Color(0xFFEBECF0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              typePain,
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3B67CD),
                    )
                  : Theme.of(context).textTheme.bodySmall,
            ),
            RatioImageoneToOne(
                assetName: assetName,
                smallWidth: 50,
                largeWidth: 60,
                smallHeight: 50,
                largeHeight: 60)
          ],
        ),
      ),
    );
  }
}
