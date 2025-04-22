import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  late AnimationController _controller;
  late Animation<Offset> _logoSlideAnimation;

  void initAnimations(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,
    );

    _logoSlideAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: const Offset(-0.2, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );
  }

  void startAnimations(BuildContext context, Widget nextScreen) {
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 600),
              pageBuilder:
                  (context, animation, secondaryAnimation) => nextScreen,
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
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
            ),
          );
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  AnimationController get controller => _controller;
  Animation<Offset> get logoSlideAnimation => _logoSlideAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
