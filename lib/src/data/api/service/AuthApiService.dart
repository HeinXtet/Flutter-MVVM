import 'package:true_protection_customer/src/data/api/DioClient.dart';

class AuthApiService {
  final DioClient _dioClient;

  AuthApiService(this._dioClient);

  Future<void> login() async {
    final data = await _dioClient.get("");
    return data;
  }
}
