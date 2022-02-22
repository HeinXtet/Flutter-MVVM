import 'package:get/get.dart';

class ViewModelFactory {
  ViewModelFactory._();

  static ViewModelFactory get to => ViewModelFactory._();

  static T vmProvider<T>(T vm) {
    return Get.put<T>(vm);
  }
}
