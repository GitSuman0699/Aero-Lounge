import 'package:flutter/material.dart';

extension WRouterPP on BuildContext {
  Future<T?> push<T>(Widget page) {
    return Navigator.push<T?>(this, MaterialPageRoute(builder: (ctx) => page));
  }

  Future<dynamic> pushReplacement(Widget page) {
    return Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (ctx) => page));
  }

  Future<T?> pushReplacementAll<T>(Widget page) {
    return Navigator.pushAndRemoveUntil<T>(
      this,
      MaterialPageRoute(builder: (ctx) => page),
      (r) => false,
    );
  }

  void pop<T>([T? result]) {
    if (Navigator.canPop(this)) {
      return Navigator.pop<T?>(this, result);
    }
  }

  Future<T?> bottomSheet<T>(Widget page) async {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => page,
    );
  }

  showSnackBar(String text) {
    if (!mounted) return;
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
  }
}

extension SisePP on BuildContext {
  Size size({double percent = 100}) {
    final size = MediaQuery.of(this).size;
    final hi = size.height * (percent / 100);
    final wi = size.width * (percent / 100);
    return Size(wi, hi);
  }

  double height({double percent = 100}) {
    final size = MediaQuery.of(this).size;
    final hi = size.height * (percent / 100);
    return hi;
  }

  double width({double percent = 100}) {
    final size = MediaQuery.of(this).size;
    final wi = size.width * (percent / 100);
    return wi;
  }
}
