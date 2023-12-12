import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ListScoreWidget extends StatelessWidget {
  final int firstNrs;
  final int lastNrs;
  final int differenceNrs;
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
          AutoSizeText.rich(
            maxFontSize: 16,
            minFontSize: 14,
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: 'ความเจ็บปวดครั้งแรก : ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF484D56),
                    )),
                TextSpan(
                    text: firstNrs.toString(),
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B67CD),
                    )),
              ],
            ),
          ),
          AutoSizeText.rich(
            maxFontSize: 16,
            minFontSize: 14,
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: 'ความเจ็บปวดครั้งล่าสุด : ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF484D56),
                    )),
                TextSpan(
                    text: lastNrs.toString(),
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B67CD),
                    )),
              ],
            ),
          ),
          AutoSizeText.rich(
            maxFontSize: 16,
            minFontSize: 14,
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                    text: 'ความเจ็บปวดลดลง ',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B67CD),
                    )),
                TextSpan(
                    text: differenceNrs.toString() + ' ระดับ',
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
