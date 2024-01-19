import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class SetBoxWorkoutWidget extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  SetBoxWorkoutWidget({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 4,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ชื่อท่าที่ ${name}',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF484D56),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    'รายละเอียดการทำ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 12
                          : 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF636A75),
                    ),
                  ),
                ),
                Text(
                  '00 : 20',
                  style: TextStyle(
                    fontFamily: "Noto Sans Thai",
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3B67CD),
                  ),
                ),
              ],
            ),
            RatioImageoneToOne(
                assetName: 'lib/assets/images/screeningPart/self_slumper.png',
                smallWidth: 60,
                largeWidth: 80,
                smallHeight: 60,
                largeHeight: 80)
          ],
        ),
      ),
    );
  }
}
