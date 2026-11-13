
import 'package:flutter/material.dart';

class SearchResultsPage extends StatefulWidget {
  final String query;

  const SearchResultsPage({
    super.key,
    required this.query,
  });

  @override
  State<SearchResultsPage> createState() =>
      _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  String sortBy = 'Recommended';

  final Set<String> wishlist = {};

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Wireless Headphones',
      'category': 'Electronics',
      'amazon': 1999.0,
      'flipkart': 1799.0,
      'imageUrl':
          'https://placehold.co/300x300/png?text=Headphones',
    },
    {
      'name': 'Smart Watch',
      'category': 'Electronics',
      'amazon': 2499.0,
      'flipkart': 2699.0,
      'imageUrl':
          'https://placehold.co/300x300/png?text=Smart+Watch',
    },
    {
      'name': 'Running Shoes',
      'category': 'Fashion',
      'amazon': 1499.0,
      'flipkart': 1299.0,
      'imageUrl':
          'https://placehold.co/300x300/png?text=Running+Shoes',
    },
    {
      'name': 'Bluetooth Speaker',
      'category': 'Electronics',
      'amazon': 1299.0,
      'flipkart': 1199.0,
      'imageUrl':
          'https://placehold.co/300x300/png?text=Speaker',
    },
  ];

  String formatPrice(double price) {
    return '₹${price.toStringAsFixed(0)}';
  }

  double lowestPrice(Map<String, dynamic> product) {
    final amazon = product['amazon'] as double;
    final flipkart = product['flipkart'] as double;

    return amazon < flipkart ? amazon : flipkart;
  }

  List<Map<String, dynamic>> get filteredProducts {
    final search = widget.query.toLowerCase().trim();

    final results = products.where((product) {
      if (search.isEmpty ||
          search == 'all' ||
          search == 'popular') {
        return true;
      }

      return product['name']
              .toString()
              .toLowerCase()
              .contains(search) ||
          product['category']
              .toString()
              .toLowerCase()
              .contains(search);
    }).toList();

    if (sortBy == 'Price: Low to High') {
      results.sort(
        (a, b) => lowestPrice(a).compareTo(lowestPrice(b)),
      );
    } else if (sortBy == 'Price: High to Low') {
      results.sort(
        (a, b) => lowestPrice(b).compareTo(lowestPrice(a)),
      );
    }

    return results;
  }

  void showWishlist() {
    final savedProducts = products
        .where((product) => wishlist.contains(product['name']))
        .toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Wishlist',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                if (savedProducts.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'No saved products yet. Tap a heart to save one!',
                    ),
                  )
                else
                  ...savedProducts.map((product) {
                    return ListTile(
                      leading: SizedBox(
                        width: 48,
                        height: 48,
                        child: Image.network(
                          product['imageUrl'] as String,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image_outlined),
                        ),
                      ),
                      title: Text(product['name'] as String),
                      subtitle: Text(
                        'From ${formatPrice(lowestPrice(product))}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                        ),
                        onPressed: () {
                          setState(() {
                            wishlist.remove(product['name']);
                          });
                          Navigator.pop(sheetContext);
                        },
                      ),
                    );
                  }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = filteredProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Compare Prices'),
        actions: [
          IconButton(
            tooltip: 'Wishlist',
            icon: const Icon(Icons.favorite_border),
            onPressed: showWishlist,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Results for "${widget.query}"',
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Compare stores and find the lowest price.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 18),

            Row(
              children: [
                const Icon(
                  Icons.sort,
                  color: Colors.deepPurple,
                ),
                const SizedBox(width: 8),
                const Text('Sort by'),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: sortBy,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Recommended',
                        child: Text('Recommended'),
                      ),
                      DropdownMenuItem(
                        value: 'Price: Low to High',
                        child: Text('Price: Low to High'),
                      ),
                      DropdownMenuItem(
                        value: 'Price: High to Low',
                        child: Text('Price: High to Low'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          sortBy = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Expanded(
              child: results.isEmpty
                  ? const Center(
                      child: Text(
                        'No demo products found.\nTry another search!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final product = results[index];

                        final amazonPrice =
                            product['amazon'] as double;
                        final flipkartPrice =
                            product['flipkart'] as double;

                        final isAmazonCheaper =
                            amazonPrice < flipkartPrice;

                        final cheapest = lowestPrice(product);
                        final isSaved = wishlist.contains(
                          product['name'],
                        );

                        return Card(
                          margin: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(14),
                                      child: Container(
                                        width: 76,
                                        height: 76,
                                        color: Colors.white,
                                        child: Image.network(
                                          product['imageUrl']
                                              as String,
                                          fit: BoxFit.contain,
                                          loadingBuilder: (
                                            context,
                                            child,
                                            loadingProgress,
                                          ) {
                                            if (loadingProgress ==
                                                null) {
                                              return child;
                                            }

                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(
                                                strokeWidth: 2,
                                              ),
                                            );
                                          },
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return const Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              size: 32,
                                              color: Colors.grey,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product['name']
                                                as String,
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight:
                                                  FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            product['category']
                                                as String,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            padding:
                                                const EdgeInsets
                                                    .symmetric(
                                              horizontal: 9,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.green
                                                  .withValues(
                                                alpha: 0.12,
                                              ),
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(20),
                                            ),
                                            child: Text(
                                              'Lowest: ${formatPrice(cheapest)}',
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontWeight:
                                                    FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      tooltip: isSaved
                                          ? 'Remove from wishlist'
                                          : 'Add to wishlist',
                                      onPressed: () {
                                        setState(() {
                                          if (isSaved) {
                                            wishlist.remove(
                                              product['name'],
                                            );
                                          } else {
                                            wishlist.add(
                                              product['name']
                                                  as String,
                                            );
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        isSaved
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: isSaved
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(height: 28),

                                _storePriceRow(
                                  store: 'Amazon',
                                  price: amazonPrice,
                                  isLowest: isAmazonCheaper,
                                ),
                                const SizedBox(height: 12),
                                _storePriceRow(
                                  store: 'Flipkart',
                                  price: flipkartPrice,
                                  isLowest: !isAmazonCheaper,
                                ),
                                const SizedBox(height: 14),

                                Text(
                                  'You save ${formatPrice((amazonPrice - flipkartPrice).abs())} by choosing the cheaper store.',
                                  style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 4),
              child: Text(
                'Demo products and prices only. Not live listings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _storePriceRow({
    required String store,
    required double price,
    required bool isLowest,
  }) {
    return Row(
      children: [
        Icon(
          Icons.storefront_outlined,
          color: store == 'Amazon' ? Colors.orange : Colors.blue,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            store,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          formatPrice(price),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isLowest ? Colors.green : null,
          ),
        ),
        const SizedBox(width: 6),
        if (isLowest)
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 18,
          ),
      ],
    );
  }
}
