import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class ListScoreWidget extends StatelessWidget {
  final int? firstNrs;
  final int? lastNrs;
  final int? differenceNrs;
  const ListScoreWidget(
      {super.key,
      required this.firstNrs,
      required this.lastNrs,
      required this.differenceNrs});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //pain score
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: 'ความเจ็บปวดครั้งแรก : ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF484D56),
                    )),
                TextSpan(
                    text: (firstNrs == null) ? '-' : firstNrs.toString(),
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B67CD),
                    )),
              ],
            ),
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: 'ความเจ็บปวดครั้งล่าสุด : ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF484D56),
                    )),
                TextSpan(
                    text: (lastNrs == null) ? '-' : lastNrs.toString(),
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B67CD),
                    )),
              ],
            ),
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: (differenceNrs != null && differenceNrs! < 0)
                        ? 'ความเจ็บปวดเพิ่มขึ้น '
                        : 'ความเจ็บปวดลดลง ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B67CD),
                    )),
                TextSpan(
                    text: (differenceNrs?.abs().toString() ?? '-') + ' ระดับ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B67CD),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
