import 'package:get/get.dart';
import 'package:true_protection_customer/src/di/ConfigureDI.dart';
import 'package:true_protection_customer/src/domain/respository/AuthRepository.dart';

class LoginViewModel extends GetxController {
  final authRepository = getIt.get<AuthRepository>();
  var username = "".obs;
  var token = "".obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = await authRepository.token ?? "";
  }

  updateToken(String token) {
    authRepository.updateToken(token);
  }
}
