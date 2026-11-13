class PriceAlert {
  final String id;
  final String productId;
  final String productName;
  final String productImageUrl;
  final double targetPrice;
  final double initialPrice;
  final double currentLowestPrice;
  final DateTime createdAt;
  final bool isTriggered;
  final bool isEnabled;

  const PriceAlert({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImageUrl,
    required this.targetPrice,
    required this.initialPrice,
    required this.currentLowestPrice,
    required this.createdAt,
    this.isTriggered = false,
    this.isEnabled = true,
  });

  double get dropRequired => currentLowestPrice - targetPrice;

  bool get shouldNotify => currentLowestPrice <= targetPrice;

  PriceAlert copyWith({
    double? currentLowestPrice,
    bool? isTriggered,
    bool? isEnabled,
  }) {
    return PriceAlert(
      id: id,
      productId: productId,
      productName: productName,
      productImageUrl: productImageUrl,
      targetPrice: targetPrice,
      initialPrice: initialPrice,
      currentLowestPrice: currentLowestPrice ?? this.currentLowestPrice,
      createdAt: createdAt,
      isTriggered: isTriggered ?? this.isTriggered,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'productId': productId,
    'productName': productName,
    'productImageUrl': productImageUrl,
    'targetPrice': targetPrice,
    'initialPrice': initialPrice,
    'currentLowestPrice': currentLowestPrice,
    'createdAt': createdAt.toIso8601String(),
    'isTriggered': isTriggered,
    'isEnabled': isEnabled,
  };

  factory PriceAlert.fromJson(Map<String, dynamic> json) => PriceAlert(
    id: json['id'] as String,
    productId: json['productId'] as String,
    productName: json['productName'] as String,
    productImageUrl: json['productImageUrl'] as String? ?? '',
    targetPrice: (json['targetPrice'] as num).toDouble(),
    initialPrice: (json['initialPrice'] as num).toDouble(),
    currentLowestPrice: (json['currentLowestPrice'] as num).toDouble(),
    createdAt: DateTime.parse(json['createdAt'] as String),
    isTriggered: json['isTriggered'] as bool? ?? false,
    isEnabled: json['isEnabled'] as bool? ?? true,
  );
}
