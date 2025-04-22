// lib/presentation/widgets/asset_item.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_colors.dart';

class AssetItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool showAddButton;

  const AssetItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.showAddButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.iconBackgroundColor,
                child: Icon(icon, color: Colors.black),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.merriweather(fontSize: 14)),
                  Text(
                    value,
                    style: GoogleFonts.merriweather(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          showAddButton
              ? ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                ),
                child: const Text('Add'),
              )
              : const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
