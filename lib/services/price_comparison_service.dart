import '../models/filter_options.dart';
import '../models/price_history.dart';
import '../models/product.dart';
import 'mock_data_service.dart';

class PriceComparisonService {
  final List<Product> _products = List.from(MockDataService.sampleProducts);

  List<Product> getAllProducts() => List.unmodifiable(_products);

  Product? getProductById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  List<Product> searchProducts({
    required String query,
    FilterOptions filterOptions = const FilterOptions(),
  }) {
    final cleanQuery = query.trim().toLowerCase();

    var results = _products.where((product) {
      final matchesQuery = cleanQuery.isEmpty ||
          cleanQuery == 'all' ||
          product.name.toLowerCase().contains(cleanQuery) ||
          product.brand.toLowerCase().contains(cleanQuery) ||
          product.category.toLowerCase().contains(cleanQuery);

      if (!matchesQuery) return false;

      // Category check
      if (filterOptions.category != 'All' &&
          !product.category
              .toLowerCase()
              .contains(filterOptions.category.toLowerCase())) {
        return false;
      }

      // Price range check
      final bestPrice = product.lowestPrice;
      if (bestPrice < filterOptions.minPrice ||
          bestPrice > filterOptions.maxPrice) {
        return false;
      }

      // Rating check
      if (product.rating < filterOptions.minRating) {
        return false;
      }

      // Store filter check
      if (filterOptions.selectedStores.isNotEmpty) {
        final hasStore = product.storePrices.any(
          (sp) => filterOptions.selectedStores.contains(sp.storeName),
        );
        if (!hasStore) return false;
      }

      return true;
    }).toList();

    // Sorting
    switch (filterOptions.sortCriteria) {
      case SortCriteria.priceLowToHigh:
        results.sort((a, b) => a.lowestPrice.compareTo(b.lowestPrice));
        break;
      case SortCriteria.priceHighToLow:
        results.sort((a, b) => b.lowestPrice.compareTo(a.lowestPrice));
        break;
      case SortCriteria.highestSavings:
        results.sort((a, b) => b.potentialSavings.compareTo(a.potentialSavings));
        break;
      case SortCriteria.ratingHighToLow:
        results.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case SortCriteria.recommended:
      default:
        // Default sort keeps original catalog priority
        break;
    }

    return results;
  }

  ProductPriceStats getPriceStats(Product product) {
    final history = MockDataService.getHistoryForProduct(product.id);
    final allPrices = [
      ...product.storePrices.map((s) => s.price),
      ...history.map((h) => h.price),
    ];

    if (allPrices.isEmpty) {
      return ProductPriceStats(
        lowestEver: product.lowestPrice,
        highestEver: product.highestPrice,
        averagePrice: product.lowestPrice,
        currentPrice: product.lowestPrice,
        history: history,
      );
    }

    final lowest = allPrices.reduce((a, b) => a < b ? a : b);
    final highest = allPrices.reduce((a, b) => a > b ? a : b);
    final average = allPrices.reduce((a, b) => a + b) / allPrices.length;

    return ProductPriceStats(
      lowestEver: lowest,
      highestEver: highest,
      averagePrice: average,
      currentPrice: product.lowestPrice,
      history: history,
    );
  }

  List<Product> getDealsOfTheDay() {
    // Products with highest savings or biggest price differences
    final list = List<Product>.from(_products);
    list.sort((a, b) => b.potentialSavings.compareTo(a.potentialSavings));
    return list.take(3).toList();
  }
}
