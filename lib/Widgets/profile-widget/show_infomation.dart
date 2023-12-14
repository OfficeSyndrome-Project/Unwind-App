import "package:flutter/material.dart";
import "package:unwind_app/Widgets/responsive_check_widget.dart";

class ShowInfomation extends StatelessWidget {
  final String headDetails;
  final String detail;
  const ShowInfomation(
      {super.key, required this.headDetails, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            headDetails,
            style: ResponsiveCheckWidget.isSmallMobile(context)
                ? TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF636A75),
                  )
                : Theme.of(context).textTheme.titleSmall,
          ),
          Expanded(
            child: Text(detail,
                style: ResponsiveCheckWidget.isSmallMobile(context)
                    ? TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF3B67CD),
                      )
                    : Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.right),
          )
        ],
      ),
    );
  }
}
