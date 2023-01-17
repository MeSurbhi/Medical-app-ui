import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SystemTheme {

  ///The number of device pixels for each logical pixel.
  static double get pixelRatio => ui.window.devicePixelRatio;

  static Size get size => ui.window.physicalSize / pixelRatio;

  ///The horizontal extent of this size.
  static double get width => size.width;

  ///The vertical extent of this size
  static double get height => size.height;

  ///The distance from the top edge to the first unpadded pixel,
  ///in physical pixels.
  static double get statusBarHeight1 => ui.window.padding.top;

  ///The distance from the bottom edge to the first unpadded pixel,
  ///in physical pixels.
  double get bottomBarHeight => ui.window.padding.bottom;
  static double guidelineBaseWidth = width;
  static double guidelineBaseHeight = height;
  static double screenWidth = width;
  static double screenHeight = height;
  static double statusBarHeight = statusBarHeight1;

  static double scale(double size) {
    return (screenWidth / guidelineBaseWidth) * (size * 1.2);
  }

  static double verticalScale(double size) {
    return (screenHeight / guidelineBaseHeight) * size;
  }

  static double moderateScale(double size, [double factor = 0.5]) {
    return size + (scale(size) - size) * factor;
  }

}
