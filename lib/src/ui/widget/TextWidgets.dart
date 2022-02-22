import 'package:flutter/material.dart';
import 'package:true_protection_customer/src/ui/screen/splash/SplashScreen.dart';

Widget HeadingText(String text,
    {TextStyle? style, bool isBold = true, Function? onPressed}) {
  final textWidget = Text(
    text,
    style:
        appTheme.getDefaultThemeData.textTheme.headline6?.merge(style).apply(),
  );
  if (onPressed != null) {
    return Touchable(textWidget, onPressed);
  } else {
    return textWidget;
  }
}

Widget BodyText(String text, {TextStyle? style, Function? onPressed}) {
  final textWidget = Text(
    text,
    style:
        appTheme.getDefaultThemeData.textTheme.bodyText1?.merge(style).apply(),
  );
  if (onPressed != null) {
    return Touchable(textWidget, onPressed);
  } else {
    return textWidget;
  }
}

Widget SubTitleText(String text, {TextStyle? style, Function? onPressed}) {
  final textWidget = Text(
    text,
    style:
        appTheme.getDefaultThemeData.textTheme.bodyText2?.merge(style).apply(),
  );
  if (onPressed != null) {
    return Touchable(textWidget, onPressed);
  } else {
    return textWidget;
  }
}

Widget Touchable(Widget child, Function onPressed) {
  return InkWell(
    child: Center(
      child: child,
    ),
    onTap: () => onPressed(),
  );
}
