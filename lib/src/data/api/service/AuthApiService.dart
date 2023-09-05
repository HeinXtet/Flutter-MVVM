import 'package:i_wallet/src/data/api/DataResponse.dart';
import 'package:i_wallet/src/data/api/DioClient.dart';
import '../../model/response/Todo.dart';

class AuthApiService {
  final DioClient _dioClient;

  AuthApiService(this._dioClient);

  Future<dynamic> login() async {
   return _dioClient.get("/todos/1");
  }
}