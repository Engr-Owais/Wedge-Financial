import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/providers/networth_provider.dart';

class PeriodSelector extends StatelessWidget {
  const PeriodSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final periods = ['1W', '1M', '6M', '1Y', 'YTD', 'Max'];
    final provider = Provider.of<NetWorthProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          periods.map((label) {
            final isSelected = label == provider.selectedPeriod;
            return ChoiceChip(
              label: Text(label),
              selected: isSelected,
              selectedColor: Colors.black,
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
              onSelected: (_) => provider.updateSelectedPeriod(label),
            );
          }).toList(),
    );
  }
}
