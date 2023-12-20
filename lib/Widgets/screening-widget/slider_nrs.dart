import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/textlabel_slider_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/textwithemoticon_label_slider.dart';

class SliderNrs extends StatefulWidget {
  const SliderNrs({Key? key}) : super(key: key);

  @override
  State<SliderNrs> createState() => _SliderNrsState();
}

class _SliderNrsState extends State<SliderNrs> {
  double oncurrentNRS = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 8),
          child: Text(
            oncurrentNRS.toStringAsFixed(0),
            style: TextStyle(
              color: Color(0xFF484D56),
              fontSize: ResponsiveCheckWidget.isSmallMobile(context) ? 18 : 22,
              fontFamily: 'Noto Sans Thai',
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        getTextWidgets(context),
        Container(
          height: 25,
          margin: EdgeInsets.only(top: 8, bottom: 8),
          child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8,
                inactiveTickMarkColor: Color(0xFFEBEDF0),
                inactiveTrackColor: Color(0xFFEBEDF0),
                activeTickMarkColor: Color(0xff2F52A4),
                activeTrackColor: Color(0xff2F52A4),
                overlayColor: Colors.transparent,
              ),
              child: Slider(
                  value: oncurrentNRS,
                  divisions: 10,
                  max: 10,
                  thumbColor: Color(0xff2F52A4),
                  allowedInteraction: SliderInteraction.tapAndSlide,
                  onChanged: (double value) {
                    setState(() {
                      oncurrentNRS = value;
                    });
                  })),
        ),
        TextWithEmoticonLabel(context),
      ],
    );
  }
}
