import 'package:get/get.dart';
import 'package:i_wallet/src/data/local/LocalDataManger.dart';

class AppViewModel extends GetxController {
  final LocalDataManagerImpl _localDataManager;

  AppViewModel(this._localDataManager);

  var loading = false.obs;

  static AppViewModel get to => Get.find();

  Future<String?> get token async {
    return _localDataManager.token;
  }
}
