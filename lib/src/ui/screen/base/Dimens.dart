import 'package:flutter/cupertino.dart';
import 'package:true_protection_customer/src/ui/screen/base/NavigationController.dart';

class Dimens {
  Dimens();

  final BuildContext context =
      NavigationController.navigatorKey.currentContext!;

  get width => MediaQuery.of(context).size.width;

  get height => MediaQuery.of(context).size.height;
}
