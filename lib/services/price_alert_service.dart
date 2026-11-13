import 'package:flutter/foundation.dart';
import '../models/price_alert.dart';
import '../models/product.dart';

class PriceAlertService extends ChangeNotifier {
  static final PriceAlertService _instance = PriceAlertService._internal();
  factory PriceAlertService() => _instance;
  PriceAlertService._internal();

  final List<PriceAlert> _alerts = [
    PriceAlert(
      id: 'alert_1',
      productId: 'p1',
      productName: 'Apple iPhone 16 Pro (128 GB)',
      productImageUrl:
          'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&q=80',
      targetPrice: 110000,
      initialPrice: 114900,
      currentLowestPrice: 112999,
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      isTriggered: false,
      isEnabled: true,
    ),
    PriceAlert(
      id: 'alert_2',
      productId: 'p2',
      productName: 'Sony WH-1000XM5 Wireless Headphones',
      productImageUrl:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&q=80',
      targetPrice: 25000,
      initialPrice: 26990,
      currentLowestPrice: 24990,
      createdAt: DateTime.now().subtract(const Duration(days: 8)),
      isTriggered: true,
      isEnabled: true,
    ),
  ];

  List<PriceAlert> get alerts => List.unmodifiable(_alerts);

  bool hasAlertFor(String productId) {
    return _alerts.any((a) => a.productId == productId);
  }

  void addAlert({
    required Product product,
    required double targetPrice,
  }) {
    // Remove old alert for this product if already exists
    _alerts.removeWhere((a) => a.productId == product.id);

    final alert = PriceAlert(
      id: 'alert_${DateTime.now().millisecondsSinceEpoch}',
      productId: product.id,
      productName: product.name,
      productImageUrl: product.imageUrl,
      targetPrice: targetPrice,
      initialPrice: product.lowestPrice,
      currentLowestPrice: product.lowestPrice,
      createdAt: DateTime.now(),
      isTriggered: product.lowestPrice <= targetPrice,
      isEnabled: true,
    );

    _alerts.insert(0, alert);
    notifyListeners();
  }

  void toggleAlert(String alertId) {
    final index = _alerts.indexWhere((a) => a.id == alertId);
    if (index != -1) {
      final old = _alerts[index];
      _alerts[index] = old.copyWith(isEnabled: !old.isEnabled);
      notifyListeners();
    }
  }

  void removeAlert(String alertId) {
    _alerts.removeWhere((a) => a.id == alertId);
    notifyListeners();
  }
}
