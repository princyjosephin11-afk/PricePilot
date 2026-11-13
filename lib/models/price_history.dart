class PriceHistoryPoint {
  final DateTime date;
  final double price;
  final String storeName;

  const PriceHistoryPoint({
    required this.date,
    required this.price,
    required this.storeName,
  });

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'price': price,
    'storeName': storeName,
  };

  factory PriceHistoryPoint.fromJson(Map<String, dynamic> json) =>
      PriceHistoryPoint(
        date: DateTime.parse(json['date'] as String),
        price: (json['price'] as num).toDouble(),
        storeName: json['storeName'] as String? ?? 'General',
      );
}

class ProductPriceStats {
  final double lowestEver;
  final double highestEver;
  final double averagePrice;
  final double currentPrice;
  final List<PriceHistoryPoint> history;

  const ProductPriceStats({
    required this.lowestEver,
    required this.highestEver,
    required this.averagePrice,
    required this.currentPrice,
    required this.history,
  });

  bool get isAtLowestPrice => currentPrice <= lowestEver;

  double get dropFromAverage {
    if (averagePrice <= 0) return 0;
    return averagePrice - currentPrice;
  }
}
