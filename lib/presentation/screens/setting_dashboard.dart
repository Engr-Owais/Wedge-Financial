import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houxton/presentation/screens/networth_screen.dart';

class DashboardLoadingScreen extends StatefulWidget {
  @override
  _DashboardLoadingScreenState createState() => _DashboardLoadingScreenState();
}

class _DashboardLoadingScreenState extends State<DashboardLoadingScreen> {
  bool step1Done = false;
  bool step2Done = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() => step1Done = true);
      Future.delayed(Duration(milliseconds: 800), () {
        setState(() => step2Done = true);
        // Navigate to next screen after a short delay
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NetWorthScreen(),
            ), // Replace with your actual next screen
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F3031),
      body: Stack(
        children: [
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Main Center Text
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "We are building your dashboard...",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,

                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "It will only take a moment, John.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),

                  // Step 1 Loader
                  StepLoader(
                    title: "Initializing your dashboard",
                    isDone: step1Done,
                  ),

                  SizedBox(height: 20),

                  // Step 2 Loader with animation
                  AnimatedOpacity(
                    opacity: step1Done ? 1.0 : 0.3,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedSlide(
                      offset: step1Done ? Offset(0, 0) : Offset(0, 0.1),
                      duration: Duration(milliseconds: 500),
                      child: StepLoader(
                        title: "Connecting your data",
                        isDone: step2Done,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StepLoader extends StatelessWidget {
  final String title;
  final bool isDone;

  const StepLoader({required this.title, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isDone
            ? Icon(Icons.check_circle, color: Colors.white, size: 24)
            : SizedBox(
              height: 24,
              width: 24,
              child: CupertinoActivityIndicator(color: Colors.white),
            ),
        SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
