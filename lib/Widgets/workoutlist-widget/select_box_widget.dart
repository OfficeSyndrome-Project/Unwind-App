import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class SelectBoxWidget extends StatelessWidget {
  final void Function()? onTap;
  final String name;
  final double width;
  final bool isTap;
  const SelectBoxWidget(
      {super.key,
      this.onTap,
      required this.name,
      required this.width,
      required this.isTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 8),
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        height: 48,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color(0xFFC3C8D2),
                ),
                borderRadius: BorderRadius.circular(8)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                color: isTap == true
                    ? Theme.of(context).colorScheme.primary
                    : Color(0xFF9BA4B5),
                fontSize:
                    ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                fontFamily: 'Noto Sans Thai',
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.unfold_more_rounded,
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        ),
      ),
    );
  }
}
