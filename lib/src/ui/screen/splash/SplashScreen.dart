import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_wallet/src/ui/screen/base/AppAssets.dart';
import 'package:i_wallet/src/ui/screen/base/AppTheme.dart';
import 'package:i_wallet/src/ui/screen/base/Dimens.dart';
import 'package:i_wallet/src/ui/screen/base/NavigationController.dart';
import 'package:i_wallet/src/ui/screen/route/Route.dart';
import 'package:i_wallet/src/ui/widget/CommonWidgets.dart';
import 'package:i_wallet/src/ui/widget/ScaledAnimationWidget.dart';
import 'package:i_wallet/src/ui/widget/SlidingAnimatedWidget.dart';
import 'package:i_wallet/src/ui/widget/TextWidgets.dart';

// TODO need to wrap with HOC Components Later
late Dimens dimens;
late NavigationController navigationController;
late AppTheme appTheme;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 2000),
    ).then(
      (value) => {
        navigationController.navigateReplacedAll(RouteName.ON_BOARDING)
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens();
    navigationController = NavigationController();
    appTheme = AppTheme();
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.getDefaultThemeData.primaryColor,
        body: SizedBox(
          width: dimens.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScaledAnimatedWidget(
                child: SvgPicture.asset(
                  AppAssets.appLogo,
                  color: Colors.white,
                ),
              ),
              VerticalSpacing(16),
              SlidingAnimatedWidget(
                child: HeadingText(
                  "True Protection",
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
