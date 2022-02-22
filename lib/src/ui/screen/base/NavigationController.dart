import 'package:flutter/cupertino.dart';

class NavigationController {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigationController();

  final BuildContext context =
      NavigationController.navigatorKey.currentContext!;

  navigateReplacedAll(String routeName) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
    );
  }
  navigate(String routeName) {
    Navigator.pushNamed(
      context,
      routeName,
    );
  }
}
