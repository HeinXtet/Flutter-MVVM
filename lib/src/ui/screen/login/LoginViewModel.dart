
import 'package:get/get.dart';
import 'package:true_protection_customer/src/di/ConfigureDI.dart';
import 'package:true_protection_customer/src/domain/respository/AuthRepository.dart';

import '../../../data/api/DataResponse.dart';
import '../../../data/model/response/Todo.dart';

class LoginViewModel extends GetxController {
  final authRepository = getIt.get<AuthRepository>();
  var todoObject = Rx<Todo?>(null);
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

  getData() async {
    DataResponse<Todo> data = await authRepository.getData();
    switch (data) {
      case DataSuccess(data: var data):
        {
          var result = (data as Todo);
          todoObject.value = result;
          username.value = result.title;
        }
      case DataError(exception: var errorMessage):{
        // update state or show error dialog
      }
    }
  }
}
