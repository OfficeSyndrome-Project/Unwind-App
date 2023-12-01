import 'package:flutter/material.dart';
import 'package:unwind_app/Routes/routes_config.dart';
import 'package:unwind_app/Widgets/radio_widget.dart';
import 'package:unwind_app/data/screening-data/screening_q_part_one_model.dart';

class ScreeningQuestionBoxWidget extends StatelessWidget {
  final String? assetPath;
  final List<String> questions;
  final int currentPage;
  final PageRoutes pageRoutes;
  final PageController controller;
  // final ScreeningPartOneModel question;

  ScreeningQuestionBoxWidget(
      {Key? key,
      required this.assetPath,
      required this.questions,
      required this.currentPage,
      required this.pageRoutes,
      required this.controller})
      : super(key: key);

void onCurrentOptionsChanged(bool bool) {
}

Widget radioWidget(BuildContext context,int index, Map<int, bool?>? currentOptions) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
        children:[
        AnimatedCustomRadio(
            value: currentOptions != null && currentOptions.containsKey(index)
                ? currentOptions[index] ?? false
                : false,
            groupValue: true,
            onChanged: (value) {
              onCurrentOptionsChanged(true);
            },
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Theme.of(context).colorScheme.primary),
        Text(
          'ใช่',
          style: Theme.of(context).textTheme.bodyLarge,
        ),]),
        const SizedBox(
          width: 16,
        ),
        Row(children: [AnimatedCustomRadio(
            value: !(currentOptions != null && currentOptions.containsKey(index)
                ? currentOptions[index] ?? true
                : true),
            groupValue: true,
            onChanged: (value) {
              onCurrentOptionsChanged(false);
            },
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Theme.of(context).colorScheme.primary),
        Text(
          'ไม่',
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    )]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (assetPath != null) // Check if assetPath is not null
            Column(
              children: [
                SizedBox(
                  width: 240,
                  height: 240,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(assetPath!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: questions.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context,index) => 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questions[index],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      radioWidget(context, index,null)
                    ],
                  )
                ,
              ))
        ]);
  }
}
