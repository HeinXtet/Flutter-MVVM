import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:true_protection_customer/firebase_options.dart';
import 'package:true_protection_customer/service/notification.dart';
import 'package:true_protection_customer/src/di/ConfigureDI.dart';
import 'package:true_protection_customer/src/ui/screen/base/AppColor.dart';
import 'package:true_protection_customer/src/ui/screen/base/AppTheme.dart';
import 'package:true_protection_customer/src/ui/screen/base/NavigationController.dart';
import 'package:true_protection_customer/src/ui/screen/route/Route.dart'
    as app_route;

// global theming configs

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryColor // status bar color
        ),
  );
  await setUpDI();

  // setup firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await NotificationHandler().init();
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationController.navigatorKey,
      routes: app_route.Route.route(context),
      initialRoute: app_route.RouteName.SPLASH,
      theme: AppTheme.defaultTheme(),
    );
  }
}
