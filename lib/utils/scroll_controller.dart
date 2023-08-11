import 'package:flutter/material.dart';

extension ScrollControllerX on ScrollController {
  Future<void> scrollToCenter() {
    return animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
