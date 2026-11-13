import 'store_price.dart';

class Product {
  final String id;
  final String name;
  final String brand;
  final String category;
  final String description;
  final String imageUrl;
  final List<String> additionalImages;
  final double rating;
  final int reviewCount;
  final List<StorePrice> storePrices;
  final Map<String, String> specifications;

  const Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.description,
    required this.imageUrl,
    this.additionalImages = const [],
    this.rating = 4.5,
    this.reviewCount = 120,
    required this.storePrices,
    this.specifications = const {},
  });

  StorePrice get bestPriceInfo {
    if (storePrices.isEmpty) {
      return const StorePrice(
        storeName: 'Unknown',
        price: 0,
        productUrl: '',
      );
    }
    return storePrices.reduce((a, b) => a.price < b.price ? a : b);
  }

  double get lowestPrice => bestPriceInfo.price;

  double get highestPrice {
    if (storePrices.isEmpty) return 0;
    return storePrices.map((s) => s.price).reduce((a, b) => a > b ? a : b);
  }

  double get potentialSavings => highestPrice - lowestPrice;

  String get cheapestStore => bestPriceInfo.storeName;

  bool get hasMultipleStores => storePrices.length > 1;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'brand': brand,
    'category': category,
    'description': description,
    'imageUrl': imageUrl,
    'additionalImages': additionalImages,
    'rating': rating,
    'reviewCount': reviewCount,
    'storePrices': storePrices.map((s) => s.toJson()).toList(),
    'specifications': specifications,
  };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as String,
    name: json['name'] as String,
    brand: json['brand'] as String? ?? '',
    category: json['category'] as String? ?? 'General',
    description: json['description'] as String? ?? '',
    imageUrl: json['imageUrl'] as String? ?? '',
    additionalImages: (json['additionalImages'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        const [],
    rating: (json['rating'] as num?)?.toDouble() ?? 4.0,
    reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
    storePrices: (json['storePrices'] as List<dynamic>?)
            ?.map((e) => StorePrice.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [],
    specifications: (json['specifications'] as Map<String, dynamic>?)?.map(
          (k, v) => MapEntry(k, v.toString()),
        ) ??
        const {},
  );
}
