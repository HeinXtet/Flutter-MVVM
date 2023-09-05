import 'package:i_wallet/src/data/api/DataResponse.dart';
import 'package:i_wallet/src/data/api/service/AuthApiService.dart';
import 'package:i_wallet/src/data/local/LocalDataManger.dart';
import 'package:i_wallet/src/data/model/response/Todo.dart';

class AuthRepository {
  final AuthApiService _apiService;
  final LocalDataManagerImpl _localDataManager;

  AuthRepository(this._apiService, this._localDataManager);

  Future<String?> get token => _localDataManager.token;

  updateToken(String token) {
    _localDataManager.updateToken(token);
  }

  Future<DataResponse<Todo>> getData() async {
    try {
      Map<String, dynamic> value = await _apiService.login();
      var response = Todo.fromJson(value);
      print("response from API :: ${response.title}");
      return DataSuccess(data: response);
    }catch(e) {
      print("API ERROR ${e.toString()}");
      return DataError(exception:e.toString());
    }
  }
}
