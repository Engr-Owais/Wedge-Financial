import 'package:flutter/material.dart';

class AnimationUtils {
  static PageRouteBuilder<T> createFadeScaleRoute<T>({
    required Widget page,
    Duration transitionDuration = const Duration(milliseconds: 600),
  }) {
    return PageRouteBuilder<T>(
      transitionDuration: transitionDuration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.98, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
