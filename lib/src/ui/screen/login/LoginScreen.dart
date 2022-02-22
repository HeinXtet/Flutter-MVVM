import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:true_protection_customer/src/ui/screen/base/AppScreen.dart';
import 'package:true_protection_customer/src/ui/screen/base/ViewModelFactory.dart';
import 'package:true_protection_customer/src/ui/screen/login/LoginViewModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel loginViewModel =
      ViewModelFactory.vmProvider(LoginViewModel());

  @override
  void initState() {
    super.initState();
    _generateFCMToken();
  }

  _generateFCMToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print("FCM Token $fcmToken");
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              loginViewModel.token.value.toString(),
            )
          ],
        ),
      ),
    );
  }
}
