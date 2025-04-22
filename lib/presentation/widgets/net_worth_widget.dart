// lib/presentation/widgets/networth_chart.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/providers/networth_provider.dart';

class NetWorthChart extends StatelessWidget {
  const NetWorthChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NetWorthProvider>(context);

    return AspectRatio(
      aspectRatio: 1.4,
      child: Container(
        color: AppColors.chartBackground,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 25,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.withOpacity(0.3),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) {
                            if (value % 1 == 0) {
                              return Text(
                                '${value.toInt()}',
                                style: const TextStyle(
                                  color: Color(0xFF263238),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 25,
                          reservedSize: 50,
                          getTitlesWidget: (value, meta) {
                            String text = '';
                            if (value == 25)
                              text = '25K';
                            else if (value == 50)
                              text = '50K';
                            else if (value == 75)
                              text = '75K';
                            else if (value == 100)
                              text = '100K';
                            else if (value == 125)
                              text = '125K';
                            else if (value == 150)
                              text = '150K';

                            return Text(
                              text,
                              style: const TextStyle(
                                color: Color(0xFF263238),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 11,
                    maxX: 17,
                    minY: 25,
                    maxY: 150,
                    lineBarsData: [
                      LineChartBarData(
                        spots: provider.dataPoints,
                        isCurved: true,
                        color: AppColors.primaryText,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          color: AppColors.primaryText.withOpacity(0.1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
