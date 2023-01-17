import 'package:flutter/material.dart';
import 'package:medical_app/base/base_view_model.dart';
import 'package:medical_app/utils/color_utils.dart';

GlobalKey<NavigatorState> appLevelKey = GlobalKey(debugLabel: 'app-key');

class AppViewModel extends BaseViewModel {
  ThemeData _themeData = ThemeData();
  AppTheme _appTheme = AppTheme.light;

  AppTheme get appTheme => _appTheme;

  ThemeData get themeData {
    switch (_appTheme) {
      case AppTheme.dark:
      case AppTheme.light:
        _themeData = _themeData.copyWith(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColor.white,
          primaryColor: AppColor.white,
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontFamily: "Poppins",
                color: AppColor.white.withOpacity(0.3),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              filled: false,
              border: InputBorder.none,
              isCollapsed: true,
              errorStyle: const TextStyle(
                fontFamily: "Poppins",
                color: AppColor.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
               // color: AppColor.black,
                fontSize: 18,
                height: 1.48,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          textTheme: _themeData.textTheme.apply(
              fontFamily: "Poppins",
            //  bodyColor: AppColor.black,
            //  displayColor: AppColor.black
          ),
          primaryTextTheme: _themeData.textTheme.apply(
              fontFamily: "Poppins",
              bodyColor: AppColor.white,
              displayColor: AppColor.white),
          iconTheme: const IconThemeData(
            color: AppColor.white,
          ),
          indicatorColor: AppColor.white,
        //  highlightColor: AppColor.primaryColor,
          buttonTheme: ButtonThemeData(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            textTheme: ButtonTextTheme.normal,
          ),
        );
        break;
    }

    return _themeData;
  }
}

enum AppTheme {
  dark,
  light,
}
