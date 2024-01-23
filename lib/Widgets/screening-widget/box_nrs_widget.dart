import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/slider_nrs.dart';

class BoxNrsWidget extends StatelessWidget {
  final Function(double)? onChanged;
  const BoxNrsWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 4,
                offset: Offset(0, 1),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ความรุนแรงของอาการ',
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF484D56),
                      )
                    : Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'หลังจากทำท่าทางดังกล่าว หากวัดความปวดเป็นตัวเลข ท่านมีความปวด ระดับใด\n(0-10 ปวดน้อยไปปวดมาก)',
                  style: ResponsiveCheckWidget.isSmallMobile(context)
                      ? TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF484D56),
                        )
                      : Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SliderNrs(onChanged: onChanged),
            ],
          ),
        )
      ],
    );
  }
}
