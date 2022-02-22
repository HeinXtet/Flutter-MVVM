import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:true_protection_customer/src/data/local/LocalDataManger.dart';
import 'package:true_protection_customer/src/di/ConfigureDI.dart';
import 'package:true_protection_customer/src/ui/state/AppViewModel.dart';

abstract class AppModule {
  static Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  static dependencies() {
    Get.put<AppViewModel>(
      AppViewModel(
        getIt<LocalDataManagerImpl>(),
      ),
    );
  }
}
