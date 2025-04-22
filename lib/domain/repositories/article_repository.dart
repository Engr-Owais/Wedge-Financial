// lib/domain/repositories/promo_repository.dart

import '../../core/network/api_service.dart';
import '../../data/models/article_model.dart';

class PromoRepository {
  final PromoService service;

  PromoRepository(this.service);

  Future<List<PromoModel>> getPromos() => service.fetchPromos();
}
