import 'package:flutter/material.dart';
import 'package:i_wallet/src/ui/screen/base/AppColor.dart';
import 'package:i_wallet/src/ui/screen/base/NavigationController.dart';

class AppTheme {
  AppTheme();

  ThemeData get getDefaultThemeData =>
      Theme.of(NavigationController.navigatorKey.currentContext!);

  static ThemeData defaultTheme() {
    return ThemeData(
      fontFamily: "Open Sans",
      textTheme: AppTextTheme.textTheme(),
      primaryColor: AppColor.primaryColor,
    );
  }
}

class AppTextTheme {
  AppTextTheme._();

  static TextTheme textTheme() {
    return const TextTheme(
      headline6: TextStyle(
        fontSize: 20,
        fontFamily: "OpenSans-Bold",
      ),
      headline5: TextStyle(
        fontSize: 24,
        fontFamily: "OpenSans-Bold",
      ),
      headline4: TextStyle(
        fontSize: 26,
      ),
      headline3: TextStyle(
        fontSize: 28,
      ),
      headline2: TextStyle(
        fontSize: 30,
      ),
      headline1: TextStyle(
        fontSize: 34,
        fontFamily: "OpenSans-Bold",
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontFamily: "OpenSans-Regular",
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontFamily: "OpenSans-Regular",
      ),
    );
  }
}
