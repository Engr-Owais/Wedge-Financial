// lib/data/services/promo_service.dart

import 'package:dio/dio.dart';
import '../../data/models/article_model.dart';

class PromoService {
  final Dio dio;

  PromoService(this.dio);

  Future<List<PromoModel>> fetchPromos() async {
    try {
      final response = await dio.get(
        'https://api-qa.getwedge.com/mock-server/v1/articles',
      );

      final articles = response.data['articles'] as List;

      return articles.map((e) => PromoModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException) {
        final res = e.response;
        throw Exception(
          "Dio error: ${res?.statusCode} ${res?.statusMessage} ${res?.data}",
        );
      }

      throw Exception('Unknown error: $e');
    }
  }
}
