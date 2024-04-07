import 'dart:math';
import 'package:flutter/material.dart';

class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxFactor = 1}) {
    final double width = MediaQuery.of(context).size.width;
    double value = (width / 1400) * maxFactor;
    return max(0.7, min(value, maxFactor));
  }
}