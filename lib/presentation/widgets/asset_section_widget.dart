// lib/presentation/widgets/assets_section.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'asset_item_widget.dart';

class AssetsSection extends StatelessWidget {
  const AssetsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Assets',
                style: GoogleFonts.merriweather(fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.add_circle_outline),
            ],
          ),
          const SizedBox(height: 10),
          const AssetItem(
            icon: Icons.account_balance,
            title: 'Cash Accounts',
            value: 'USD 0.00',
            showAddButton: true,
          ),
          const AssetItem(
            icon: Icons.savings,
            title: 'Investments',
            value: 'USD 4,000,000.00',
            showAddButton: false,
          ),
          const AssetItem(
            icon: Icons.pedal_bike,
            title: 'Pensions',
            value: 'USD 4,000,000.00',
            showAddButton: false,
          ),
          const AssetItem(
            icon: Icons.house,
            title: 'Properties',
            value: 'USD 0.00',
            showAddButton: true,
          ),
        ],
      ),
    );
  }
}
