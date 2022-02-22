import 'package:true_protection_customer/src/data/api/service/AuthApiService.dart';
import 'package:true_protection_customer/src/data/local/LocalDataManger.dart';

class AuthRepository {
  final AuthApiService _apiService;
  final LocalDataManagerImpl _localDataManager;

  AuthRepository(this._apiService, this._localDataManager);

  Future<String?> get token => _localDataManager.token;

  updateToken(String token) {
    _localDataManager.updateToken(token);
  }
}
