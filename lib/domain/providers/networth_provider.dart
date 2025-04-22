// lib/domain/providers/networth_provider.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../data/models/article_model.dart';
import '../repositories/article_repository.dart';

enum PromoState { initial, loading, loaded, error }

class NetWorthProvider extends ChangeNotifier {
  final PromoRepository repository;

  NetWorthProvider(this.repository);

  PromoState _state = PromoState.initial;
  List<PromoModel> _promos = [];
  String _error = '';

  PromoState get state => _state;
  List<PromoModel> get promos => _promos;
  String get error => _error;

  String _selectedPeriod = '1W';
  String get selectedPeriod => _selectedPeriod;

  Future<void> loadPromos() async {
    _state = PromoState.loading;
    notifyListeners();

    try {
      _promos = await repository.getPromos();
      _state = PromoState.loaded;
    } catch (e) {
      _error = e.toString();
      _state = PromoState.error;
    }

    notifyListeners();
  }

  // Sample data points for the chart
  final List<FlSpot> dataPoints = [
    const FlSpot(11, 25),
    const FlSpot(11.5, 45),
    const FlSpot(12, 75),
    const FlSpot(12.5, 95),
    const FlSpot(13, 108),
    const FlSpot(13.25, 93),
    const FlSpot(13.5, 93),
    const FlSpot(14, 93),
    const FlSpot(14.25, 105),
    const FlSpot(14.5, 117),
    const FlSpot(15, 117),
    const FlSpot(15.5, 117),
    const FlSpot(16, 117),
    const FlSpot(16.5, 130),
    const FlSpot(17, 147),
  ];

  void updateSelectedPeriod(String period) {
    _selectedPeriod = period;
    notifyListeners();
  }
}
