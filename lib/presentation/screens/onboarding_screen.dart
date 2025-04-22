import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'auth_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/animation_utils.dart';
import '../../data/models/featureItem.dart';

import '../../domain/providers/onboarding_provider.dart';
import '../widgets/feature_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late OnboardingProvider _onboardingProvider;

  @override
  void initState() {
    super.initState();
    _onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    _onboardingProvider.initAnimations(this);
    _onboardingProvider.startAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // Background watermark images
            Positioned(
              top: 30,
              child: Opacity(
                opacity: 0.8,
                child: Image.asset('assets/Vector.png'),
              ),
            ),
            Positioned(
              bottom: -20.0,
              right: 0.0,
              child: Opacity(
                opacity: 0.8,
                child: Image.asset('assets/Vector (1).png'),
              ),
            ),

            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                  // Title section
                  Expanded(
                    flex: 2,
                    child: AnimatedBuilder(
                      animation: Listenable.merge([
                        _onboardingProvider.titleFirstPartOpacity,
                        _onboardingProvider.titleSecondPartOpacity,
                        _onboardingProvider.titleToTopSlide,
                      ]),
                      builder: (context, child) {
                        return _buildTitleSection();
                      },
                    ),
                  ),

                  // Features section
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: FadeTransition(
                      opacity: _onboardingProvider.pointsOpacity,
                      child: SlideTransition(
                        position: _onboardingProvider.pointsSlide,
                        child: _buildFeaturesList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Get started button
                  FadeTransition(
                    opacity: _onboardingProvider.buttonOpacity,
                    child: SlideTransition(
                      position: _onboardingProvider.buttonSlide,
                      child: _buildGetStartedButton(context),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return SlideTransition(
      position: _onboardingProvider.titleToTopSlide,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              FadeTransition(
                opacity: _onboardingProvider.titleFirstPartOpacity,
                child: SlideTransition(
                  position: _onboardingProvider.titleFirstPartSlide,
                  child: Text(
                    "Take Control ",
                    style: GoogleFonts.playfairDisplay(
                      color: AppColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _onboardingProvider.titleSecondPartOpacity,
                child: Text(
                  "of Your",
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.accent,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          FadeTransition(
            opacity: _onboardingProvider.titleSecondPartOpacity,
            child: Text(
              "Wealth with Hoxton",
              style: GoogleFonts.playfairDisplay(
                color: AppColors.accent,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          FadeTransition(
            opacity: _onboardingProvider.titleSecondPartOpacity,
            child: Text(
              "Wealth App",
              style: GoogleFonts.playfairDisplay(
                color: AppColors.accent,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          OnboardingData.features
              .map(
                (feature) =>
                    FeatureItem(icon: feature.icon, text: feature.text),
              )
              .toList(),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            AnimationUtils.createFadeScaleRoute(page: ContinueScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.white),
          ),
          elevation: 0,
        ),
        child: const Text(
          "Get started",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
