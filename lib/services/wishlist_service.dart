import 'package:flutter/foundation.dart';
import '../models/product.dart';
import 'mock_data_service.dart';

class WishlistService extends ChangeNotifier {
  static final WishlistService _instance = WishlistService._internal();
  factory WishlistService() => _instance;
  WishlistService._internal();

  final Set<String> _wishlistProductIds = {'p1', 'p2'}; // Preload sample items

  Set<String> get wishlistIds => Set.unmodifiable(_wishlistProductIds);

  bool isInWishlist(String productId) => _wishlistProductIds.contains(productId);

  void toggleWishlist(String productId) {
    if (_wishlistProductIds.contains(productId)) {
      _wishlistProductIds.remove(productId);
    } else {
      _wishlistProductIds.add(productId);
    }
    notifyListeners();
  }

  void addToWishlist(String productId) {
    if (_wishlistProductIds.add(productId)) {
      notifyListeners();
    }
  }

  void removeFromWishlist(String productId) {
    if (_wishlistProductIds.remove(productId)) {
      notifyListeners();
    }
  }

  List<Product> getWishlistProducts() {
    return MockDataService.sampleProducts
        .where((p) => _wishlistProductIds.contains(p.id))
        .toList();
  }

  double getTotalPotentialSavings() {
    return getWishlistProducts().fold<double>(
      0.0,
      (total, product) => total + product.potentialSavings,
    );
  }
}
