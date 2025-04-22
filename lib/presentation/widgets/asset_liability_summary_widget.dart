// lib/presentation/widgets/asset_liability_summary.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetLiabilitySummary extends StatelessWidget {
  const AssetLiabilitySummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Assets',
                style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
              ),
              Text(
                'Liabilities',
                style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(color: Colors.green.shade800),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'USD 50,000,000.00',
                style: GoogleFonts.merriweather(fontSize: 16),
              ),
              Text('USD 0.00', style: GoogleFonts.merriweather(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
