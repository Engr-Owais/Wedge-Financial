import 'package:flutter/material.dart';
import 'package:houxton/presentation/screens/onboarding_screen.dart';

import '../presentation/screens/networth_screen.dart';
import '../presentation/screens/splash_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String networth = '/networth';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case networth:
        return MaterialPageRoute(builder: (_) => NetWorthScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
