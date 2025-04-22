import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  late AnimationController _titleFirstPartController;
  late AnimationController _titleSecondPartController;
  late AnimationController _titleMoveController;
  late AnimationController _pointsController;
  late AnimationController _buttonController;

  late Animation<double> _titleFirstPartOpacity;
  late Animation<Offset> _titleFirstPartSlide;
  late Animation<double> _titleSecondPartOpacity;
  late Animation<Offset> _titleToTopSlide;
  late Animation<double> _pointsOpacity;
  late Animation<Offset> _pointsSlide;
  late Animation<double> _buttonOpacity;
  late Animation<Offset> _buttonSlide;

  // Getters for animations
  Animation<double> get titleFirstPartOpacity => _titleFirstPartOpacity;
  Animation<Offset> get titleFirstPartSlide => _titleFirstPartSlide;
  Animation<double> get titleSecondPartOpacity => _titleSecondPartOpacity;
  Animation<Offset> get titleToTopSlide => _titleToTopSlide;
  Animation<double> get pointsOpacity => _pointsOpacity;
  Animation<Offset> get pointsSlide => _pointsSlide;
  Animation<double> get buttonOpacity => _buttonOpacity;
  Animation<Offset> get buttonSlide => _buttonSlide;

  // Initialize animations
  void initAnimations(TickerProvider vsync) {
    _titleFirstPartController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    _titleSecondPartController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );

    _titleMoveController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );

    _pointsController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );

    // Adjust the animations to start from the center
    _titleToTopSlide = Tween<Offset>(
      begin: const Offset(0, 1), // Initially at center
      end: const Offset(0, -0.15), // Move up by 15% of screen height
    ).animate(
      CurvedAnimation(parent: _titleMoveController, curve: Curves.easeInOut),
    );

    // Configure the other animations
    _titleFirstPartOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _titleFirstPartController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
      ),
    );

    _titleFirstPartSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _titleFirstPartController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _titleSecondPartOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _titleSecondPartController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
      ),
    );

    _pointsOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _pointsController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
      ),
    );

    _pointsSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _pointsController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    _buttonOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );

    _buttonSlide = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  // Start the animations sequence
  void startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _titleFirstPartController.forward();

    await Future.delayed(const Duration(milliseconds: 1000));
    _titleSecondPartController.forward();

    await Future.delayed(const Duration(milliseconds: 1200));
    _titleMoveController.forward();

    await Future.delayed(const Duration(milliseconds: 600));
    _pointsController.forward();

    await Future.delayed(const Duration(milliseconds: 400));
    _buttonController.forward();
  }

  // Dispose controllers when no longer needed
  @override
  void dispose() {
    _titleFirstPartController.dispose();
    _titleSecondPartController.dispose();
    _titleMoveController.dispose();
    _pointsController.dispose();
    _buttonController.dispose();
    super.dispose();
  }
}
