import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_wallet/src/ui/screen/splash/SplashScreen.dart';
import 'package:i_wallet/src/ui/state/AppViewModel.dart';

class AppScreen extends StatelessWidget {
  final Widget child;

  const AppScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: dimens.width,
              child: child,
            ),
            Center(
              child: Obx(
                () => AppViewModel.to.loading.isTrue
                    ? const CircularProgressIndicator()
                    : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
