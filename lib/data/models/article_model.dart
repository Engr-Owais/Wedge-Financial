// lib/data/models/promo_model.dart

class PromoModel {
  final String header;
  final String content;

  PromoModel({required this.header, required this.content});

  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return PromoModel(
      header: json['header'] ?? 'No Title',
      content: json['content'] ?? 'No Description',
    );
  }
}
