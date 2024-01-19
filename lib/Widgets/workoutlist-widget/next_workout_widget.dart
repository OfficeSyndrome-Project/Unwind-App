import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class NextWorkoutWidget extends StatelessWidget {
  final String name;
  final int time;
  final String descrip;
  final String assetName;
  const NextWorkoutWidget(
      {super.key,
      required this.name,
      required this.time,
      required this.descrip,
      required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ท่าต่อไป',
            style: TextStyle(
              fontFamily: "Noto Sans Thai",
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 18 : 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF484D56),
            ),
          ),
          Container(
            width: 208,
            margin: EdgeInsets.symmetric(vertical: 16),
            padding: EdgeInsets.all(16),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RatioImageoneToOne(
                    assetName: assetName,
                    smallWidth: 140,
                    largeWidth: 160,
                    smallHeight: 140,
                    largeHeight: 160),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(top: 16, bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name + '\n' + '${time} วินาที',
                    style: TextStyle(
                      color: Color(0xFF484D56),
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontFamily: 'Noto Sans Thai',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    descrip,
                    style: TextStyle(
                      color: Color(0xFF636A75),
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 12
                          : 14,
                      fontFamily: 'Noto Sans Thai',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Color(0xFFC9635F),
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
                    fontFamily: 'Noto Sans Thai',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                    text: ' หากท่านมีอาการปวดขณะบริหาร ให้หยุดและพักทันที',
                    style: TextStyle(
                      color: Color(0xFF484D56),
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontFamily: 'Noto Sans Thai',
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
