import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/deal.dart';
import '../models/price_history.dart';
import '../models/product.dart';
import '../models/store_price.dart';

class MockDataService {
  static final List<CategoryModel> categories = [
    const CategoryModel(
      id: 'cat_all',
      name: 'All',
      icon: Icons.grid_view_rounded,
      description: 'Explore all price comparisons',
      itemCount: 16,
    ),
    const CategoryModel(
      id: 'cat_electronics',
      name: 'Electronics',
      icon: Icons.devices_rounded,
      description: 'Smartphones, laptops & gadgets',
      itemCount: 6,
    ),
    const CategoryModel(
      id: 'cat_audio',
      name: 'Audio',
      icon: Icons.headphones_rounded,
      description: 'Headphones, earbuds & speakers',
      itemCount: 4,
    ),
    const CategoryModel(
      id: 'cat_wearables',
      name: 'Wearables',
      icon: Icons.watch_rounded,
      description: 'Smartwatches & fitness trackers',
      itemCount: 3,
    ),
    const CategoryModel(
      id: 'cat_fashion',
      name: 'Fashion',
      icon: Icons.checkroom_rounded,
      description: 'Clothing, sneakers & lifestyle',
      itemCount: 3,
    ),
    const CategoryModel(
      id: 'cat_gaming',
      name: 'Gaming',
      icon: Icons.sports_esports_rounded,
      description: 'Consoles, controllers & accessories',
      itemCount: 2,
    ),
  ];

  static final List<Product> sampleProducts = [
    const Product(
      id: 'p1',
      name: 'Apple iPhone 16 Pro (128 GB)',
      brand: 'Apple',
      category: 'Electronics',
      description:
          'Stunning titanium design with Camera Control, 48MP Fusion camera, and the blazing fast A18 Pro chip. Incredible battery life and Action button.',
      imageUrl: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&q=80',
      rating: 4.8,
      reviewCount: 3420,
      storePrices: [
        StorePrice(
          storeName: 'Amazon',
          price: 114900,
          originalPrice: 119900,
          productUrl: 'https://amazon.in/dp/example1',
          deliveryText: 'Free One-Day Delivery for Prime',
          rating: 4.8,
        ),
        StorePrice(
          storeName: 'Flipkart',
          price: 112999,
          originalPrice: 119900,
          productUrl: 'https://flipkart.com/dp/example1',
          deliveryText: 'Express Delivery by tomorrow',
          rating: 4.7,
        ),
        StorePrice(
          storeName: 'Croma',
          price: 116900,
          originalPrice: 119900,
          productUrl: 'https://croma.com/dp/example1',
          deliveryText: 'Standard Store Pickup available',
          rating: 4.6,
        ),
        StorePrice(
          storeName: 'Reliance Digital',
          price: 114490,
          originalPrice: 119900,
          productUrl: 'https://reliancedigital.in/dp/example1',
          deliveryText: 'Same day store dispatch',
          rating: 4.6,
        ),
      ],
      specifications: {
        'Display': '6.3-inch Super Retina XDR OLED ProMotion',
        'Processor': 'A18 Pro Bionic Chip',
        'Camera': '48MP + 48MP Ultra-wide + 12MP 5x Telephoto',
        'Battery': 'Up to 27 hours video playback',
      },
    ),
    const Product(
      id: 'p2',
      name: 'Sony WH-1000XM5 Wireless Headphones',
      brand: 'Sony',
      category: 'Audio',
      description:
          'Industry-leading active noise canceling with two processors and 8 microphones. Crystal clear hands-free calling with 4 beamforming mics.',
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&q=80',
      rating: 4.7,
      reviewCount: 1850,
      storePrices: [
        StorePrice(
          storeName: 'Amazon',
          price: 25990,
          originalPrice: 34990,
          productUrl: 'https://amazon.in/dp/example2',
          deliveryText: 'Free Delivery by Friday',
          rating: 4.8,
        ),
        StorePrice(
          storeName: 'Flipkart',
          price: 26990,
          originalPrice: 34990,
          productUrl: 'https://flipkart.com/dp/example2',
          deliveryText: 'Delivery in 2 days',
          rating: 4.6,
        ),
        StorePrice(
          storeName: 'Croma',
          price: 24990,
          originalPrice: 34990,
          productUrl: 'https://croma.com/dp/example2',
          deliveryText: 'Instant store pickup available',
          rating: 4.7,
        ),
      ],
      specifications: {
        'Battery Life': 'Up to 30 hours with ANC on',
        'Driver': '30mm precision-engineered carbon fiber',
        'Weight': '250 grams',
        'Bluetooth': 'v5.2 with LDAC, AAC, SBC',
      },
    ),
    const Product(
      id: 'p3',
      name: 'Samsung Galaxy Watch 7 (Bluetooth 44mm)',
      brand: 'Samsung',
      category: 'Wearables',
      description:
          'AI-powered health insights, Dual-Frequency GPS, BioActive Sensor 2, and advanced sleep apnea detection in a sleek armor aluminum frame.',
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&q=80',
      rating: 4.6,
      reviewCount: 920,
      storePrices: [
        StorePrice(
          storeName: 'Amazon',
          price: 29999,
          originalPrice: 32999,
          productUrl: 'https://amazon.in/dp/example3',
          deliveryText: 'Free delivery',
          rating: 4.6,
        ),
        StorePrice(
          storeName: 'Flipkart',
          price: 28499,
          originalPrice: 32999,
          productUrl: 'https://flipkart.com/dp/example3',
          deliveryText: 'Delivered by tomorrow',
          rating: 4.5,
        ),
        StorePrice(
          storeName: 'Reliance Digital',
          price: 28990,
          originalPrice: 32999,
          productUrl: 'https://reliancedigital.in/dp/example3',
          deliveryText: 'Express courier',
          rating: 4.6,
        ),
      ],
      specifications: {
        'Display': '1.5-inch Super AMOLED Sapphire Crystal',
        'OS': 'Wear OS 5 with One UI Watch 6',
        'Durability': '5ATM + IP68 / MIL-STD-810H',
      },
    ),
    const Product(
      id: 'p4',
      name: 'Apple MacBook Air M3 (13.6-inch, 16GB, 512GB)',
      brand: 'Apple',
      category: 'Electronics',
      description:
          'Lean, mean, M3 machine. Incredibly portable with up to 18 hours of battery life and support for up to two external displays with laptop lid closed.',
      imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&q=80',
      rating: 4.9,
      reviewCount: 1420,
      storePrices: [
        StorePrice(
          storeName: 'Amazon',
          price: 124990,
          originalPrice: 134900,
          productUrl: 'https://amazon.in/dp/example4',
          deliveryText: 'Prime Free Delivery',
          rating: 4.9,
        ),
        StorePrice(
          storeName: 'Flipkart',
          price: 126900,
          originalPrice: 134900,
          productUrl: 'https://flipkart.com/dp/example4',
          deliveryText: 'Standard delivery',
          rating: 4.7,
        ),
        StorePrice(
          storeName: 'Croma',
          price: 122990,
          originalPrice: 134900,
          productUrl: 'https://croma.com/dp/example4',
          deliveryText: 'Store pickup in 3 hours',
          rating: 4.8,
        ),
      ],
      specifications: {
        'Processor': 'Apple M3 Chip (8-core CPU, 10-core GPU)',
        'Unified Memory': '16GB',
        'Storage': '512GB SSD',
        'Weight': '1.24 kg',
      },
    ),
    const Product(
      id: 'p5',
      name: 'Sony PlayStation 5 Slim (Digital Edition)',
      brand: 'Sony',
      category: 'Gaming',
      description:
          'Experience lightning-fast loading with an ultra-high speed SSD, deeper immersion with haptic feedback, adaptive triggers, and 3D Audio.',
      imageUrl: 'https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=600&q=80',
      rating: 4.8,
      reviewCount: 3100,
      storePrices: [
        StorePrice(
          storeName: 'Amazon',
          price: 44990,
          originalPrice: 49990,
          productUrl: 'https://amazon.in/dp/example5',
          deliveryText: 'Next Day Delivery',
          rating: 4.8,
        ),
        StorePrice(
          storeName: 'Flipkart',
          price: 43499,
          originalPrice: 49990,
          productUrl: 'https://flipkart.com/dp/example5',
          deliveryText: 'Standard delivery in 2 days',
          rating: 4.7,
        ),
        StorePrice(
          storeName: 'Reliance Digital',
          price: 44490,
          originalPrice: 49990,
          productUrl: 'https://reliancedigital.in/dp/example5',
          deliveryText: 'Express 4-hour delivery in select cities',
          rating: 4.6,
        ),
      ],
      specifications: {
        'Storage': '1TB Custom NVMe SSD',
        'Resolution': 'Up to 4K 120Hz / 8K output support',
        'Audio': 'Tempest 3D AudioTech',
      },
    ),
    const Product(
      id: 'p6',
      name: 'Nike Air Zoom Pegasus 40 Running Shoes',
      brand: 'Nike',
      category: 'Fashion',
      description:
          'A springy ride for any run with responsive Nike React technology and two Zoom Air units in the forefoot and heel.',
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600&q=80',
      rating: 4.5,
      reviewCount: 780,
      storePrices: [
        StorePrice(
          storeName: 'Myntra',
          price: 7995,
          originalPrice: 11895,
          productUrl: 'https://myntra.com/dp/example6',
          deliveryText: 'Free delivery by Monday',
          rating: 4.5,
        ),
        StorePrice(
          storeName: 'Amazon',
          price: 8499,
          originalPrice: 11895,
          productUrl: 'https://amazon.in/dp/example6',
          deliveryText: 'Prime shipping',
          rating: 4.4,
        ),
        StorePrice(
          storeName: 'Flipkart',
          price: 8299,
          originalPrice: 11895,
          productUrl: 'https://flipkart.com/dp/example6',
          deliveryText: 'Standard Delivery',
          rating: 4.3,
        ),
        StorePrice(
          storeName: 'Tata CLiQ',
          price: 7699,
          originalPrice: 11895,
          productUrl: 'https://tatacliq.com/dp/example6',
          deliveryText: 'Delivered in 3 days',
          rating: 4.6,
        ),
      ],
      specifications: {
        'Sole Material': 'Rubber Waffle Outsole',
        'Closure': 'Lace-Up',
        'Cushioning': 'Dual Zoom Air units + React foam',
      },
    ),
  ];

  static List<PriceHistoryPoint> getHistoryForProduct(String productId) {
    final now = DateTime.now();
    switch (productId) {
      case 'p1':
        return [
          PriceHistoryPoint(
            date: now.subtract(const Duration(days: 60)),
            price: 119900,
            storeName: 'Amazon',
          ),
          PriceHistoryPoint(
            date: now.subtract(const Duration(days: 45)),
            price: 117900,
            storeName: 'Amazon',
          ),
          PriceHistoryPoint(
            date: now.subtract(const Duration(days: 30)),
            price: 115999,
            storeName: 'Flipkart',
          ),
          PriceHistoryPoint(
            date: now.subtract(const Duration(days: 15)),
            price: 114900,
            storeName: 'Amazon',
          ),
          PriceHistoryPoint(
            date: now,
            price: 112999,
            storeName: 'Flipkart',
          ),
        ];
      case 'p2':
        return [
          PriceHistoryPoint(
            date: now.subtract(const Duration(days: 60)),
            price: 29990,
            storeName: 'Amazon',
          ),
          PriceHistoryPoint(
            date: now.subtract(const Duration(days: 30)),
            price: 27990,
            storeName: 'Flipkart',
          ),
          PriceHistoryPoint(
            date: now.subtract(const Duration(days: 10)),
            price: 25990,
            storeName: 'Amazon',
          ),
          PriceHistoryPoint(
            date: now,
            price: 24990,
            storeName: 'Croma',
          ),
        ];
      default:
        return [
          PriceHistoryPoint(
            date: now.subtract(const Duration(days: 30)),
            price: 5000,
            storeName: 'Amazon',
          ),
          PriceHistoryPoint(
            date: now,
            price: 4500,
            storeName: 'Flipkart',
          ),
        ];
    }
  }

  static final List<DealItem> activeDeals = [
    const DealItem(
      id: 'd1',
      title: 'Mega Electronics Festival',
      subtitle: 'Extra ₹2,500 off on HDFC & ICICI Credit Cards',
      code: 'PILOTDEAL25',
      discountPercent: 15,
      storeName: 'Amazon',
      validUntil: 'Valid till Sunday',
      category: 'Electronics',
    ),
    const DealItem(
      id: 'd2',
      title: 'Flipkart Big Savings Days',
      subtitle: 'Flat 10% instant discount on Axis Bank cards',
      code: 'AXISDROP10',
      discountPercent: 10,
      storeName: 'Flipkart',
      validUntil: '2 days left',
      category: 'All',
    ),
    const DealItem(
      id: 'd3',
      title: 'Audio Mania at Croma',
      subtitle: 'Up to 40% off on premium headphones & soundbars',
      code: 'CROMAAUDIO',
      discountPercent: 20,
      storeName: 'Croma',
      validUntil: 'Ends tonight',
      category: 'Audio',
    ),
  ];
}
