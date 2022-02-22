import 'package:flutter/material.dart';
import 'package:true_protection_customer/src/ui/screen/splash/SplashScreen.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final bool active;
  final Function onPressed;
  final double? width, height,radius;

  const PrimaryButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.width,
      this.height,
        this.radius,
      this.active = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActive = active;
    final primaryColor = appTheme.getDefaultThemeData.primaryColor;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isActive ? primaryColor : Colors.grey.withAlpha(40),
        onPrimary: Colors.white,
        shadowColor: primaryColor.withAlpha(50),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 2),
        ),
        minimumSize: Size(width ?? dimens.width, height ?? 55),
      ),
      onPressed: () => {
        if (isActive) {onPressed()}
      },
      child: child,
    );
  }
}
