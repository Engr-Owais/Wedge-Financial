import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'domain/providers/splash_provider.dart';
import 'domain/providers/animation_provider.dart';
import 'domain/providers/onboarding_provider.dart';
import 'presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => AnimationProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: MaterialApp(
        title: 'Hoxton Wealth',
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
