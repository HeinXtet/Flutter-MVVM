import 'package:flutter/material.dart';
import 'package:i_wallet/src/ui/screen/splash/SplashScreen.dart';
import 'package:i_wallet/src/ui/widget/CommonWidgets.dart';

Widget DotIndicator(bool isActive) {
  final primaryColor = appTheme.getDefaultThemeData.primaryColor;

  return Column(
    children: [
      SizedBox(
        height: 20,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 150,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 4.0,
          ),
          height: isActive ? 16 : 8.0,
          width: isActive ? 12 : 8.0,
          decoration: BoxDecoration(
            boxShadow: [
              isActive
                  ? BoxShadow(
                      color: primaryColor.withOpacity(
                        0.72,
                      ),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                    )
                  : const BoxShadow(
                      color: Colors.transparent,
                    )
            ],
            borderRadius: isActive ? BorderRadius.circular(8) : BorderRadius.circular(24),
            color: isActive ? primaryColor : const Color(0XFFEAEAEA),
          ),
        ),
      ),
      VerticalSpacing(
        8,
      )
    ],
  );
}
