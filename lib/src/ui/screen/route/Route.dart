import 'package:flutter/cupertino.dart';
import 'package:i_wallet/src/ui/screen/login/LoginScreen.dart';
import 'package:i_wallet/src/ui/screen/onboarding/OnBoarding.dart';
import 'package:i_wallet/src/ui/screen/splash/SplashScreen.dart';

class Route {
  Route._();

  static route(BuildContext context) => {
        RouteName.SPLASH: (context) => SplashScreen(),
        RouteName.LOGIN: (context) => LoginScreen(),
        RouteName.ON_BOARDING: (context) => OnBoarding(),
      };
}

class RouteName {
  RouteName._();

  static const SPLASH = "/splash";
  static const LOGIN = "/login";
  static const ON_BOARDING = "/onboarding";
}
