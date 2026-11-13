class DealItem {
  final String id;
  final String title;
  final String subtitle;
  final String code;
  final int discountPercent;
  final String storeName;
  final String validUntil;
  final String category;
  final String? bannerImageUrl;

  const DealItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.code,
    required this.discountPercent,
    required this.storeName,
    required this.validUntil,
    required this.category,
    this.bannerImageUrl,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subtitle': subtitle,
    'code': code,
    'discountPercent': discountPercent,
    'storeName': storeName,
    'validUntil': validUntil,
    'category': category,
    'bannerImageUrl': bannerImageUrl,
  };

  factory DealItem.fromJson(Map<String, dynamic> json) => DealItem(
    id: json['id'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    code: json['code'] as String,
    discountPercent: (json['discountPercent'] as num).toInt(),
    storeName: json['storeName'] as String,
    validUntil: json['validUntil'] as String,
    category: json['category'] as String,
    bannerImageUrl: json['bannerImageUrl'] as String?,
  );
}
