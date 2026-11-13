# 🏷️ PricePilot — Smart Cross-Store Price Comparison App

[![Flutter Version](https://img.shields.io/badge/Flutter-3.44+-blue.svg)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.12+-teal.svg)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-purple.svg)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**PricePilot** is a modern, cross-platform Flutter application engineered to help consumers find the best deals, track price fluctuations, compare prices across major e-commerce platforms (Amazon, Flipkart, Croma, Reliance Digital, Myntra, Tata CLiQ), and set automated price drop alerts.

---

## ✨ Key Features

- 🔍 **Multi-Store Real-Time Comparison**: Compare prices, stock availability, and delivery guarantees across top e-commerce retailers simultaneously.
- 📉 **Historical Price Trends & Analytics**: Interactive chart visualizations showing 30-day/90-day price trends, all-time lows, and price averages to prevent fake discounts.
- 🔔 **Intelligent Price Drop Alerts**: Set target thresholds and custom percentage drops (-5%, -10%, -15%) for automated notifications when deals trigger.
- 💰 **Savings Calculator**: Automatically highlights the cheapest store and shows real-time calculated savings between retailer offerings.
- 🎟️ **Hot Deals & Promo Codes**: Curated daily flash sales, bank card discount offers, and one-tap coupon code copying.
- ❤️ **Interactive Wishlist**: Monitor saved items with instant notifications and cumulative savings tracking.
- 🌓 **Material 3 Design**: Clean, accessible, modern UI with support for dynamic theming and high-contrast visuals.

---

## 🏗️ Architecture & Project Structure

```
lib/
├── constants/
│   └── app_constants.dart          # Store branding, supported platforms, currencies
├── models/
│   ├── category_model.dart         # Category taxonomy models
│   ├── deal.dart                   # Coupons and flash sale models
│   ├── filter_options.dart         # Search filters and sorting criteria
│   ├── price_alert.dart            # Target price threshold alerts
│   ├── price_history.dart          # Historic price tracking data
│   ├── product.dart                # Product metadata and catalog model
│   ├── store_price.dart            # Store-specific pricing, stock, & direct URLs
│   └── user_profile.dart           # User profile and preference model
├── screens/
│   ├── create_account_page.dart    # Account registration
│   ├── deals_page.dart             # Daily deals and coupon codes
│   ├── home_page.dart              # Main discovery dashboard
│   ├── login_page.dart             # Authentication interface
│   ├── main_navigation_screen.dart # Bottom navigation bar controller
│   ├── price_alerts_page.dart      # Active alert tracker
│   ├── product_detail_page.dart    # Comparison breakdown and price history
│   ├── profile_page.dart           # Settings, currency, and theme toggles
│   ├── search_results_page.dart    # Filtered search and sorting
│   └── wishlist_page.dart          # Saved items and potential savings
├── services/
│   ├── auth_service.dart           # Authentication & session management
│   ├── mock_data_service.dart      # Realistic multi-store catalog
│   ├── price_alert_service.dart    # Alert threshold notifier
│   ├── price_comparison_service.dart # Search, filtering, and savings math
│   └── wishlist_service.dart       # Reactive wishlist state manager
├── theme/
│   └── app_theme.dart              # Material 3 light & dark design tokens
├── widgets/
│   ├── category_chip.dart          # Filterable category pills
│   ├── deal_card.dart              # Gradient coupon card with copy action
│   ├── empty_state_view.dart       # Friendly fallback illustrations
│   ├── price_alert_dialog.dart     # Threshold configuration modal
│   ├── price_history_chart.dart    # Custom Canvas price trend painter
│   ├── product_card.dart           # Store comparison product card
│   └── store_price_card.dart       # Store-specific price row and buy button
└── main.dart                       # App entry point
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (`>= 3.44.0`)
- [Dart SDK](https://dart.dev/get-dart) (`>= 3.12.0`)
- Android Studio / Xcode / VS Code with Flutter extension

### Installation & Run

1. **Clone the repository**:
   ```bash
   git clone https://github.com/princyjosephin11-afk/PricePilot.git
   cd PricePilot
   ```

2. **Fetch dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run tests**:
   ```bash
   flutter test
   ```

4. **Launch the application**:
   ```bash
   flutter run
   ```

---

## 🛡️ License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
