import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/button_withouticon_widget.dart';
import 'package:unwind_app/Widgets/ratio_imageone_to_one.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/Widgets/screening-widget/slider_nrs.dart';
import 'package:unwind_app/data/screening-data/workout_data.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';
import 'package:unwind_app/injection_container.dart';

enum NrsType { after, before }

class NrsAfterAndBeforePage extends StatefulWidget {
  final WorkoutList workoutList;
  final NrsType nrsType;
  NrsAfterAndBeforePage({
    super.key,
    required this.workoutList,
    required this.nrsType,
  });

  @override
  State<NrsAfterAndBeforePage> createState() => _NrsAfterAndBeforePageState();
}

class _NrsAfterAndBeforePageState extends State<NrsAfterAndBeforePage> {
  final PageRoutes pageRoutes = PageRoutes();
  double nrs = 0;
  WorkoutListDB workoutListDB = serviceLocator();
  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
        iconButtonStart: IconButton(
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Theme.of(context).colorScheme.primary),
        colorBar: Colors.transparent,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ]),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Text(
                    (widget.nrsType == NrsType.before)
                        ? 'ก่อนบริหารร่างกาย'
                        : (widget.nrsType == NrsType.after)
                            ? 'หลังบริหารร่างกาย'
                            : '',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 16
                          : 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF484D56),
                    ),
                  ),
                ),
                RatioImageoneToOne(
                    assetName: widget.workoutList.titlePath,
                    smallWidth: 120,
                    largeWidth: 150,
                    smallHeight: 120,
                    largeHeight: 150),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'หากวัดความปวดเป็นตัวเลข\nท่านมีความปวดบริเวณดังกล่าวระดับใด',
                    style: TextStyle(
                      fontFamily: "Noto Sans Thai",
                      fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                          ? 14
                          : 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF484D56),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SliderNrs(
                  onChanged: onNrsChange,
                ),
              ],
            ),
          ),
          ButtonWithoutIconWidget(
              onTap: () async {
                final now = DateTime.now();
                final nrs_saving = (widget.nrsType == NrsType.before)
                    ? saveNrsBefore
                    : saveNrsAfter;
                int success = await nrs_saving(nrs, now);
                print('successfully saved nrs: $nrs ($success record)');
                if (widget.nrsType == NrsType.before) {
                  Navigator.push(
                      context,
                      pageRoutes.workout
                          .preparebeforeworkout(widget.workoutList)
                          .route(context));
                  return;
                }
                if (widget.nrsType == NrsType.after) {
                  Navigator.pushReplacement(
                      context, pageRoutes.home.workoutlist().route(context));
                  return;
                }
              },
              text: "ยืนยัน",
              radius: 32,
              width: double.infinity,
              height: ResponsiveCheckWidget.isSmallMobile(context) ? 48 : 52,
              color: Theme.of(context).colorScheme.primary,
              borderSide: BorderSide.none,
              style: ResponsiveCheckWidget.isSmallMobile(context)
                  ? TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF),
                    )
                  : Theme.of(context).textTheme.headlineSmall),
        ]);
  }

  onNrsChange(double nrs) {
    this.nrs = nrs;
  }

  Future<int> saveNrsBefore(double nrs, DateTime now) async {
    final wol = await workoutListDB.getWorkoutListByDate(now);
    if (wol.isEmpty || wol.first.WOL_id == null) {
      // Failed to get workout list on that day
      return 0;
    }
    return await workoutListDB.updateNRSbefore(nrs.toInt(), wol.first.WOL_id!);
  }

  Future<int> saveNrsAfter(double nrs, DateTime now) async {
    final wol = await workoutListDB.getWorkoutListByDate(now);
    if (wol.isEmpty || wol.first.WOL_id == null) {
      // Failed to get workout list on that day
      return 0;
    }
    await updateRemainingTime(now, widget.workoutList);
    return await workoutListDB.updateNRSafter(nrs.toInt(), wol.first.WOL_id!);
  }

  updateRemainingTime(DateTime date, WorkoutList workoutList) async {
    final wol = await workoutListDB.getWorkoutListByDateAndTitle(
        date, workoutList.titleCode);
    if (wol.isEmpty || wol.first.WOL_id == null) {
      return 0;
    }
    return workoutListDB.updateRemainingTimes(
        (wol.first.remaining_times ?? 0) - 1, wol.first.WOL_id!);
  }
}
