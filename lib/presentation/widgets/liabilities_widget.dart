// lib/presentation/widgets/liabilities_section.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiabilitiesSection extends StatelessWidget {
  const LiabilitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Liabilities',
                style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
              ),
              Text(
                'You currently have no liabilities added to your profile.',
                style: GoogleFonts.merriweather(fontSize: 12),
              ),
            ],
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
