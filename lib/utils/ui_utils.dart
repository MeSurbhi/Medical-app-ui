import 'package:flutter/material.dart';

class UIUtils {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isMobile(BuildContext context) {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    if (data.size.shortestSide < 550) {
      return true;
    }
    return false;
  }
}
