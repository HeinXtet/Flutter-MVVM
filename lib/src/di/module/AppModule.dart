import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:i_wallet/src/data/local/LocalDataManger.dart';
import 'package:i_wallet/src/di/ConfigureDI.dart';
import 'package:i_wallet/src/ui/state/AppViewModel.dart';

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
