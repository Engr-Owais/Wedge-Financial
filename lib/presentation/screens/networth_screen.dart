import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/network/api_service.dart';
import '../../domain/providers/networth_provider.dart';
import '../../domain/repositories/article_repository.dart';
import '../widgets/asset_liability_summary_widget.dart';
import '../widgets/asset_section_widget.dart';
import '../widgets/feature_card_widget.dart';
import '../widgets/icon_box_widget.dart';
import '../widgets/liabilities_widget.dart';
import '../widgets/net_worth_widget.dart';
import '../widgets/period_selctor_widget.dart';
import '../widgets/promo_card_consumer.dart';

class NetWorthScreen extends StatelessWidget {
  NetWorthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) =>
              NetWorthProvider(PromoRepository(PromoService(Dio())))
                ..loadPromos(),

      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Net Worth',
                  style: GoogleFonts.merriweather(fontSize: 18),
                ),
                Text(
                  'USD 12,500,000.00',
                  style: GoogleFonts.b612(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '↑ USD 234,567.89 (6.89%)',
                  style: GoogleFonts.b612(color: Colors.green),
                ),
                const SizedBox(height: 8),
                Text(
                  'Last updated 9 hours ago',
                  style: GoogleFonts.b612(fontSize: 12),
                ),
                const SizedBox(height: 16),

                const NetWorthChart(),
                const SizedBox(height: 8),

                const PeriodSelector(),
                const SizedBox(height: 20),

                const AssetLiabilitySummary(),
                const SizedBox(height: 16),

                const AssetsSection(),
                const SizedBox(height: 16),

                const LiabilitiesSection(),
                const SizedBox(height: 16),

                FeatureCard(
                  imagePath: 'assets/forecast.png',
                  title: 'Forecast Your Financial Future with WealthFlow',
                  description:
                      'See how your wealth could grow over time. WealthFlow helps you forecast future projections based on your assets, growth assumptions, and inflation trends.',
                  buttonText: 'Create Wealth Forecast',
                  onPressed: () {},
                ),
                const SizedBox(height: 16),

                FeatureCard(
                  imagePath: 'assets/watchlist.png',
                  title: 'Your Watchlist',
                  description:
                      'Track stocks, ETFs, crypto, and currencies–all in one place. Stay updated with market shifts',
                  buttonText: 'Start Tracking',
                  onPressed: () {},
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: IconBox(
                        imagePath: 'assets/services.png',
                        title: 'Services',
                        subtitle:
                            'Speak with an expert to receive help in achieving your goals',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: IconBox(
                        imagePath: 'assets/vault.png',
                        title: 'Vault',
                        subtitle:
                            'Store your documents securely, only you can access them',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                const PromoList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
