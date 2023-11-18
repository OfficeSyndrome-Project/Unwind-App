import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/radio-widget.dart';

class QuestionEegonomicWidget extends StatelessWidget {
  final String question;
  final String imagePath;
  final Function(bool) onCurrentOptionsChanged;
  final Map<int, bool?> currentOptions;
  final int index;

  const QuestionEegonomicWidget({
    super.key,
    required this.question,
    required this.imagePath,
    required this.onCurrentOptionsChanged,
    required this.currentOptions,
    required this.index,
  });

  Widget RadioWidget(BuildContext context, Map<int, bool?>? currentOptions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
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
        ),
        const SizedBox(
          width: 16,
        ),
        AnimatedCustomRadio(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 166,
            height: 90,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                width: 166,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            question,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          RadioWidget(context, currentOptions),
        ],
      ),
    );
  }
}

// class RowRadio extends StatelessWidget {
// const RowRadio({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context){
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [ 
//         AnimatedCustomRadio(
//                   value:  currentOptions[index] ?? false, 
//                   groupValue: true,
//                   onChanged: (value) {
//                     onCurrentOptionsChanged(true);
//                   },
//                   activeColor: Theme.of(context).colorScheme.primary,
//                   inactiveColor: Theme.of(context).colorScheme.primary),
//               Text(
//                 'ใช่',
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               AnimatedCustomRadio(
//                   value: !(currentOptions[index] ?? true),
//                   groupValue: true,
//                   onChanged: (value) {
//                     onCurrentOptionsChanged(false);
//                   },
//                   activeColor: Theme.of(context).colorScheme.primary,
//                   inactiveColor: Theme.of(context).colorScheme.primary),
//               Text(
//                 'ไม่',
//                 style: Theme.of(context).textTheme.bodyLarge,
//               )],
//     );
//   }
// }