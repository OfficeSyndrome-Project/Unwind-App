import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class PrepareWorkoutWidget extends StatelessWidget {
  final String assetName;
  const PrepareWorkoutWidget({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              'เตรียมพร้อมสำหรับการบริหาร !',
              style: TextStyle(
                fontFamily: "Noto Sans Thai",
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 18 : 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF2C3036),
              ),
            ),
          ),
          RatioImageoneToOne(
              assetName: assetName,
              smallWidth: 320,
              largeWidth: 380,
              smallHeight: 320,
              largeHeight: 380),
        ],
      ),
    );
  }
}
