import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class RowResultNrsWidget extends StatelessWidget {
  final int firstNrs;
  final int lastestNrs;
  const RowResultNrsWidget(
      {Key? key, required this.firstNrs, required this.lastestNrs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ค่า NRS ครั้งแรก',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF646a76),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 16),
                child: Text(
                  '${firstNrs}',
                  style: TextStyle(
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 20 : 28,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ค่า NRS ครั้งล่าสุด',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 12 : 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF646a76),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 16),
                child: Text(
                  '${lastestNrs}',
                  style: TextStyle(
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 20 : 28,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
