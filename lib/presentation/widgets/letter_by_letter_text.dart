import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/animation_provider.dart';

class LetterByLetterText extends StatelessWidget {
  final AnimationController controller;
  final double startTime;

  const LetterByLetterText({
    Key? key,
    required this.controller,
    required this.startTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationProvider = Provider.of<AnimationProvider>(
      context,
      listen: false,
    );

    // Split into two words with different styles
    const String textHoxton = 'Hoxton';
    const String textWealth = 'Wealth';

    final double letterDurationHoxton =
        (1.0 - startTime) * 0.5 / textHoxton.length;
    final double letterDurationWealth =
        (1.0 - startTime) * 0.5 / textWealth.length;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // First word (Hoxton)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(textHoxton.length, (index) {
            // Calculate animation timing for each letter
            final double startPercentage =
                startTime + index * letterDurationHoxton;
            final double endPercentage = startPercentage + letterDurationHoxton;

            return _buildAnimatedLetter(
              textHoxton[index],
              startPercentage,
              endPercentage,
              FontWeight.w500,
              animationProvider,
            );
          }),
        ),
        // Second word (Wealth)
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(textWealth.length, (index) {
            // Calculate animation timing for each letter
            // Start after the "Hoxton" animation is complete
            final double startPercentage =
                startTime + 0.5 + index * letterDurationWealth;
            final double endPercentage = startPercentage + letterDurationWealth;

            return _buildAnimatedLetter(
              textWealth[index],
              startPercentage,
              endPercentage,
              FontWeight.w700,
              animationProvider,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAnimatedLetter(
    String letter,
    double startInterval,
    double endInterval,
    FontWeight weight,
    AnimationProvider animationProvider,
  ) {
    // Fade animation for each letter
    final fadeAnimation = animationProvider.createLetterFadeAnimation(
      controller: controller,
      startInterval: startInterval,
      endInterval: endInterval,
    );

    // Slide animation for each letter
    final slideAnimation = animationProvider.createLetterSlideAnimation(
      controller: controller,
      startInterval: startInterval,
      endInterval: endInterval,
    );

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Text(
          letter,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: weight,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
