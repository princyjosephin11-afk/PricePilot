import 'package:flutter/material.dart';
import '../services/wishlist_service.dart';
import '../widgets/empty_state_view.dart';
import '../widgets/product_card.dart';
import 'product_detail_page.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlist = WishlistService();

    return AnimatedBuilder(
      animation: wishlist,
      builder: (context, _) {
        final products = wishlist.getWishlistProducts();
        final totalSavings = wishlist.getTotalPotentialSavings();

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'My Wishlist',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              if (products.isNotEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      '${products.length} items',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          body: products.isEmpty
              ? EmptyStateView(
                  icon: Icons.favorite_border_rounded,
                  title: 'Your Wishlist is Empty',
                  message:
                      'Save items you are monitoring to easily compare prices and catch price drops across stores.',
                  buttonText: 'Start Exploring',
                  onButtonPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Savings Summary Banner
                    if (totalSavings > 0)
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.savings_outlined,
                              color: Colors.green,
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Total Potential Savings',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    'You can save up to ₹${totalSavings.toStringAsFixed(0)} by choosing the best stores!',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ...products.map(
                      (p) => ProductCard(
                        product: p,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailPage(product: p),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
