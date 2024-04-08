import 'dart:math';

import 'package:flutter/material.dart';

class ScaledSize {
  ScaledSize({
    required this.textScaleFactor,
    required this.isMinFactor,
    required this.isMaxFactor,
  });

  final double textScaleFactor;
  final bool isMinFactor;
  final bool isMaxFactor;
  static const int _laptopAverageFullWidth = 1400;

  static ScaledSize from(
      {required Size size, double minFactor = 0.7, double maxFactor = 1}) {
    final double width = size.width;
    double value = (width / _laptopAverageFullWidth) * maxFactor;
    double textScaleFactor = max(minFactor, min(value, maxFactor));
    return ScaledSize(
        textScaleFactor: textScaleFactor,
        isMinFactor: (textScaleFactor == minFactor),
        isMaxFactor: textScaleFactor == maxFactor);
  }
}
