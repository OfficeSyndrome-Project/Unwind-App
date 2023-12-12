import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
          AutoSizeText.rich(
            maxFontSize: 16,
            minFontSize: 14,
            maxLines: 1,
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: 'ความเจ็บปวดลดลง ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF484D56),
                    )),
                TextSpan(
                    text: '${nrsScoreAverage.toString()} ระดับ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: 16,
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
