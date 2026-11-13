class StorePrice {
  final String storeName;
  final double price;
  final double? originalPrice;
  final String productUrl;
  final bool inStock;
  final String deliveryText;
  final double rating;

  const StorePrice({
    required this.storeName,
    required this.price,
    this.originalPrice,
    required this.productUrl,
    this.inStock = true,
    this.deliveryText = 'Standard Delivery',
    this.rating = 4.5,
  });

  int get discountPercentage {
    if (originalPrice == null || originalPrice! <= price) return 0;
    return (((originalPrice! - price) / originalPrice!) * 100).round();
  }

  Map<String, dynamic> toJson() => {
    'storeName': storeName,
    'price': price,
    'originalPrice': originalPrice,
    'productUrl': productUrl,
    'inStock': inStock,
    'deliveryText': deliveryText,
    'rating': rating,
  };

  factory StorePrice.fromJson(Map<String, dynamic> json) => StorePrice(
    storeName: json['storeName'] as String,
    price: (json['price'] as num).toDouble(),
    originalPrice: (json['originalPrice'] as num?)?.toDouble(),
    productUrl: json['productUrl'] as String? ?? 'https://example.com',
    inStock: json['inStock'] as bool? ?? true,
    deliveryText: json['deliveryText'] as String? ?? 'Standard Delivery',
    rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
  );
}
