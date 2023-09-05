import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_wallet/src/ui/screen/route/Route.dart';
import 'package:i_wallet/src/ui/screen/splash/SplashScreen.dart';
import 'package:i_wallet/src/ui/widget/TextWidgets.dart';
import 'package:i_wallet/src/ui/widget/button/PrimaryButton.dart';
import 'package:i_wallet/src/ui/widget/DotIndicator.dart';


class OnBoardingData {
  final String title;
  final String description;

  OnBoardingData(this.title, this.description);
}

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var selectedIndex = 0;
  final onBoardingDatas = [
    OnBoardingData("BodyGuard Service", "This is bodyguard service"),
    OnBoardingData("BodyGuard Service 2", "This is bodyguard service"),
    OnBoardingData("BodyGuard Service 3", "This is bodyguard service"),
  ];

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (page) => {
              setState(() {
                selectedIndex = page;
              })
            },
            controller: pageController,
            scrollDirection: Axis.vertical,
            children: onBoardingDatas
                .map(
                  (e) => _onBoardingRow(e),
                )
                .toList(),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 40,
                height: 100,
                child: Column(
                  children: _buildPageIndicator(),
                ),
              ),
            ),
          ),
          Visibility(
            visible: selectedIndex != 2,
            child: Positioned(
              right: 8,
              top: 50,
              child: TextButton(
                onPressed: () {
                  navigationController.navigate(RouteName.LOGIN);
                },
                child: Text(
                  "Skip",
                  style: themeData.textTheme.bodyText1?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 24,
            right: 24,
            child: PrimaryButton(
              child: BodyText(
                selectedIndex == 2 ? "Login" : "Next",
                style: themeData.textTheme.bodyText1
                    ?.copyWith(color: Colors.white),
              ),
              onPressed: () {
                if (selectedIndex == 2) {
                  navigationController.navigate(RouteName.LOGIN);
                } else {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _onBoardingRow(OnBoardingData data) {
    return SizedBox(
      width: 40,
      height: 100,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(
                data.title,
                style: Get.textTheme.headline1?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              BodyText(
                data.description,
                style: Get.textTheme.bodyText1?.copyWith(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == selectedIndex ? DotIndicator(true) : DotIndicator(false));
    }
    return list;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
