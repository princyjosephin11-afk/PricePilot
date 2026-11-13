enum SortCriteria {
  recommended,
  priceLowToHigh,
  priceHighToLow,
  highestSavings,
  ratingHighToLow,
}

class FilterOptions {
  final String category;
  final double minPrice;
  final double maxPrice;
  final Set<String> selectedStores;
  final double minRating;
  final SortCriteria sortCriteria;

  const FilterOptions({
    this.category = 'All',
    this.minPrice = 0,
    this.maxPrice = 200000,
    this.selectedStores = const {},
    this.minRating = 0.0,
    this.sortCriteria = SortCriteria.recommended,
  });

  FilterOptions copyWith({
    String? category,
    double? minPrice,
    double? maxPrice,
    Set<String>? selectedStores,
    double? minRating,
    SortCriteria? sortCriteria,
  }) {
    return FilterOptions(
      category: category ?? this.category,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      selectedStores: selectedStores ?? this.selectedStores,
      minRating: minRating ?? this.minRating,
      sortCriteria: sortCriteria ?? this.sortCriteria,
    );
  }
}
