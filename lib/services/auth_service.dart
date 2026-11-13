import 'package:flutter/foundation.dart';
import '../models/user_profile.dart';

class AuthService extends ChangeNotifier {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  UserProfile? _currentUser = const UserProfile(
    id: 'user_1',
    fullName: 'Princy Josephin',
    email: 'princyjosephin11@gmail.com',
    preferredCurrency: '₹',
    enableNotifications: true,
    enablePriceDropAlerts: true,
    enableDarkMode: false,
  );

  bool _isLoggedIn = true;

  UserProfile? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (email.trim().isNotEmpty && password.length >= 6) {
      _isLoggedIn = true;
      _currentUser = UserProfile(
        id: 'user_${email.hashCode}',
        fullName: email.split('@').first,
        email: email,
      );
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (name.isNotEmpty && email.contains('@') && password.length >= 6) {
      _isLoggedIn = true;
      _currentUser = UserProfile(
        id: 'user_${email.hashCode}',
        fullName: name,
        email: email,
      );
      notifyListeners();
      return true;
    }
    return false;
  }

  void updateProfile(UserProfile updated) {
    _currentUser = updated;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _currentUser = null;
    notifyListeners();
  }
}
