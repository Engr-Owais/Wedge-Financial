import 'package:flutter/material.dart';

class AnimationProvider extends ChangeNotifier {
  Animation<double> createLetterFadeAnimation({
    required AnimationController controller,
    required double startInterval,
    required double endInterval,
  }) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          startInterval.clamp(0.0, 1.0),
          endInterval.clamp(0.0, 1.0),
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Animation<Offset> createLetterSlideAnimation({
    required AnimationController controller,
    required double startInterval,
    required double endInterval,
  }) {
    return Tween<Offset>(
      begin: const Offset(-0.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          startInterval.clamp(0.0, 1.0),
          endInterval.clamp(0.0, 1.0),
          curve: Curves.easeOut,
        ),
      ),
    );
  }
}
