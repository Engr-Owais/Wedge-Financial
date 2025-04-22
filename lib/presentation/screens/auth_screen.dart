import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'setting_dashboard.dart';

class ContinueScreen extends StatefulWidget {
  @override
  State<ContinueScreen> createState() => _ContinueScreenState();
}

class _ContinueScreenState extends State<ContinueScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Focus the email field when the screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_emailFocusNode);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF10332A), // dark green
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 600),
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                          SetPasswordScreen(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    // Fade + slight scale combo for elegance
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 0.98, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOut,
                          ),
                        ),
                        child: child,
                      ),
                    );
                  },
                ),
              );
            },

            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFEAF2F0), // light greenish background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Your Email',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Create a new account or continue where you left off.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              const Text(
                'Email',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black87, fontSize: 14),
                  children: [
                    const TextSpan(
                      text: 'By clicking on continue you agree with our ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              // Handle Privacy Policy tap
                            },
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Terms & Conditions.',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              // Handle T&C tap
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFF113E37);
    final iconColor = const Color(0xFF4C9D8D);
    final backgroundColor = const Color(0xFFEFF4F1);

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: backgroundColor,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: themeColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 600),
                pageBuilder:
                    (context, animation, secondaryAnimation) =>
                        DashboardLoadingScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  // Fade + slight scale combo for elegance
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.98, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                      ),
                      child: child,
                    ),
                  );
                },
              ),
            );
          },

          child: Text(
            'Set Password',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set Password',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Create a strong password to secure your account.',
                  style: GoogleFonts.inter(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 24),
                Text(
                  'Password',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Icon(Icons.visibility_off_outlined),
                    hintText: '',
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Password Requirements:',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ...[
                  '8-16 characters only',
                  'Atleast 1 number',
                  'Atleast 1 special character like !#@\$',
                  'Atleast 1 upper case character',
                  'Atleast 1 lower case character',
                ].map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.radio_button_unchecked, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock_outline_rounded,
                      color: iconColor,
                      size: 24,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'We use bank-grade encryption and multi-layer protection '
                        'to keep your financial data safe from day one.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
