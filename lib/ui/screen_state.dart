import 'package:flutter/material.dart';

enum ScreenState {
  portrait,
  landscape,
  ;

  static ScreenState from(Size size) {
    return (size.width >= 1400 && size.width >= size.height)
        ? ScreenState.landscape
        : ScreenState.portrait;
  }
}
