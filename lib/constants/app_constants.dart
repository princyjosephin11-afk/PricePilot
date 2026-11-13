import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'PricePilot';
  static const String appTagline = 'Compare prices across stores & save money';
  static const String defaultCurrency = '₹';

  // Supported store names
  static const String storeAmazon = 'Amazon';
  static const String storeFlipkart = 'Flipkart';
  static const String storeCroma = 'Croma';
  static const String storeReliance = 'Reliance Digital';
  static const String storeMyntra = 'Myntra';
  static const String storeTataCliq = 'Tata CLiQ';

  static const List<String> supportedStores = [
    storeAmazon,
    storeFlipkart,
    storeCroma,
    storeReliance,
    storeMyntra,
    storeTataCliq,
  ];

  // Store Brand Colors
  static Color getStoreColor(String storeName) {
    switch (storeName) {
      case storeAmazon:
        return const Color(0xFFFF9900);
      case storeFlipkart:
        return const Color(0xFF2874F0);
      case storeCroma:
        return const Color(0xFF00B5B5);
      case storeReliance:
        return const Color(0xFFE42529);
      case storeMyntra:
        return const Color(0xFFFF3F6C);
      case storeTataCliq:
        return const Color(0xFF212121);
      default:
        return Colors.deepPurple;
    }
  }

  // Categories
  static const List<String> categories = [
    'All',
    'Electronics',
    'Audio',
    'Wearables',
    'Fashion',
    'Home & Kitchen',
    'Gaming',
    'Beauty',
  ];
}
