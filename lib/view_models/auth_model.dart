import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _loading = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get loading => _loading;

  void isLoading(bool isLoading) {
    _loading = isLoading;
    notifyListeners();
  }

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
