// import 'package:flutter/material.dart';
// import 'package:unwind_app/Widgets/responsive_check_widget.dart';
// import 'package:unwind_app/Widgets/screening-widget/box_results_workout.dart';

// class BoxHaveWorkoutListWidget extends StatelessWidget {
//   final String name;
//   final int index;
//   const BoxHaveWorkoutListWidget(
//       {Key? key, required this.name, required this.index})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(8)),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               decoration: ShapeDecoration(
//                   color: Color(0xFF3B67CD),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(8),
//                           topRight: Radius.circular(8)))),
//               alignment: Alignment.center,
//               padding: EdgeInsets.symmetric(vertical: 8),
//               child: Text(name,
//                   style: TextStyle(
//                     fontSize:
//                         ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center),
//             ),
//             Container(
//               child: ListView.separated(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) => BoxResultsWorkout(name: '1'),
//                   separatorBuilder: (context, index) => Container(
//                         width: double.infinity,
//                         decoration: ShapeDecoration(
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                                 width: 1,
//                                 color: Color(0xFFEBECF0),
//                                 strokeAlign: BorderSide.strokeAlignCenter),
//                           ),
//                         ),
//                       ),
//                   itemCount: 4),
//             ),
//           ],
//         ));
//   }
// }
