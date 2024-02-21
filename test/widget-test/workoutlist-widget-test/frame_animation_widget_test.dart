import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:unwind_app/Widgets/workoutlist-widget/frame_animation_widget.dart';

void main() {
  testWidgets('FrameAnimation Widget Test', (WidgetTester tester) async {
    const List<String> animationPaths = [
      'lib/assets/images/blank_profile.png',
      'lib/assets/images/clock.jpg'
    ];
    const int duration = 10;
    void onReadyToPlay(ImageSequenceAnimatorState state) {}

    await tester.pumpWidget(
      MaterialApp(
        home: FrameAnimation(
          fullPaths: animationPaths,
          duration: duration,
          onReadyToPlay: onReadyToPlay,
        ),
      ),
    );

    expect(find.byType(ImageSequenceAnimator), findsOneWidget);
    await tester.pump(Duration.zero);
    expect(find.byType(ImageSequenceAnimator), findsOneWidget);
  });
}
