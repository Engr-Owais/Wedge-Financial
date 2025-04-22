import 'package:flutter/material.dart';
import 'package:houxton/presentation/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/providers/splash_provider.dart';

import '../widgets/letter_by_letter_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late SplashProvider _splashProvider;

  @override
  void initState() {
    super.initState();
    _splashProvider = Provider.of<SplashProvider>(context, listen: false);
    _splashProvider.initAnimations(this);
    _splashProvider.startAnimations(context, const OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          // Background watermark logo
          Positioned(
            top: 60,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset('assets/Vector.png'),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset('assets/Vector (1).png'),
            ),
          ),
          // Logo and text with animations
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo with slide animation
                SlideTransition(
                  position: _splashProvider.logoSlideAnimation,
                  child: Image.asset('assets/Group.png', width: 60, height: 60),
                ),
                // Letter-by-letter text animation
                LetterByLetterText(
                  controller: _splashProvider.controller,
                  startTime: 0.4, // Start after logo animation completes
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
