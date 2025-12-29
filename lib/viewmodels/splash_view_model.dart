import 'package:flutter/material.dart';
import 'dart:async';

class SplashViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _nextRoute;
  String? get nextRoute => _nextRoute;

  SplashViewModel() {
    _startLoading();
  }

  Future<void> _startLoading() async {
    await Future.delayed(const Duration(seconds: 3));

    _isLoading = false;
    notifyListeners();
  }
}