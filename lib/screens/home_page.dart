
import 'package:flutter/material.dart';
import 'search_results_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Fashion', 'icon': Icons.checkroom_outlined},
    {'name': 'Electronics', 'icon': Icons.devices_outlined},
    {'name': 'Beauty', 'icon': Icons.face_retouching_natural},
    {'name': 'Food & Groceries', 'icon': Icons.shopping_basket_outlined},
    {'name': 'Home & Kitchen', 'icon': Icons.home_outlined},
    {'name': 'Gaming', 'icon': Icons.sports_esports_outlined},
  ];

  void _openSearch(BuildContext context, String query) {
    if (query.trim().isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchResultsPage(query: query.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PricePilot',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
            tooltip: 'Wishlist',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline),
            tooltip: 'Profile',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello! 👋',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'What are you looking for today?',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 22),

            // Product search
            TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => _openSearch(context, value),
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () =>
                      _openSearch(context, searchController.text),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Browse Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View all'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 105,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => _openSearch(
                        context,
                        category['name'] as String,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            category['icon'] as IconData,
                            size: 30,
                            color: Colors.deepPurple,
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              category['name'] as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              '🔥 Popular Searches',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _searchChip(context, 'iPhone 16'),
                  _searchChip(context, 'AirPods'),
                  _searchChip(context, 'Nike Shoes'),
                  _searchChip(context, 'Lipstick'),
                  _searchChip(context, 'Laptop'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchChip(BuildContext context, String text) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.deepPurple.shade100),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _openSearch(context, text),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
