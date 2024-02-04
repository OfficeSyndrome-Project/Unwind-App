import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';

class alertDialog {
  static Future<bool?> getshowDialog(
          BuildContext context,
          String headText,
          String? subText,
          void Function()? onNoTap,
          void Function()? onYesTap) =>
      showDialog<bool>(
          context: context,
          barrierDismissible: false,
          barrierColor: const Color.fromARGB(122, 245, 245, 250),
          builder: (BuildContext dialogcontext) => Center(
                child: Container(
                  width: 238,
                  height: 128,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F3B67CD),
                          blurRadius: 15,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        headText,
                        style: TextStyle(
                          color: Color(0xFF484D56),
                          fontFamily: "Noto Sans Thai",
                          fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                              ? 12
                              : 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      subText == null
                          ? SizedBox()
                          : Text(
                              subText,
                              style: TextStyle(
                                color: Color(0xFF484D56),
                                fontFamily: "Noto Sans Thai",
                                fontSize:
                                    ResponsiveCheckWidget.isSmallMobile(context)
                                        ? 12
                                        : 14,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonWithoutIconWidget(
                              onTap: onNoTap,
                              text: "ไม่",
                              radius: 8,
                              width: 63,
                              height: 32,
                              color: Colors.white,
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.primary),
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: ResponsiveCheckWidget.isSmallMobile(
                                          context)
                                      ? 12
                                      : 14,
                                  fontFamily: "Noto Sans Thai",
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                  letterSpacing: 1.0)),
                          SizedBox(
                            width: 8,
                          ),
                          ButtonWithoutIconWidget(
                              onTap: onYesTap,
                              text: "ใช่",
                              radius: 8,
                              width: 63,
                              height: 32,
                              color: Theme.of(context).colorScheme.primary,
                              borderSide: BorderSide.none,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    ResponsiveCheckWidget.isSmallMobile(context)
                                        ? 12
                                        : 14,
                                fontFamily: "Noto Sans Thai",
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
}
