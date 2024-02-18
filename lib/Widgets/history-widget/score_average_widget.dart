import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class ScoreAverageWidget extends StatelessWidget {
  final int nrsScoreAverage;
  const ScoreAverageWidget({super.key, required this.nrsScoreAverage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
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
                    text: (nrsScoreAverage >= 0)
                        ? 'ความเจ็บปวดลดลง '
                        : 'ความเจ็บปวดเพิ่มขึ้น ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF484D56),
                    )),
                TextSpan(
                    text: '${nrsScoreAverage.abs().toString()} ระดับ',
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
