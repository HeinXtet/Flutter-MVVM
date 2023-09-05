import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_wallet/src/ui/screen/base/AppScreen.dart';
import 'package:i_wallet/src/ui/screen/base/ViewModelFactory.dart';
import 'package:i_wallet/src/ui/screen/login/LoginViewModel.dart';
import 'package:i_wallet/src/ui/widget/TextWidgets.dart';
import 'package:i_wallet/src/ui/widget/button/PrimaryButton.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Obx(
            () =>
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  loginViewModel.username.value.toString(),
                ),
                if (loginViewModel.todoObject.value != null)
                  Text(
                    loginViewModel.todoObject.value.toString()
                  ),
                PrimaryButton(
                    child: BodyText("Login User"),
                    onPressed: () {
                      loginViewModel.getData();
                    })
              ],
            ),
      ),
    );
  }
}
