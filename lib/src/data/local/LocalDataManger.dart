import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataManager {
  late Future<String?> token;

  void updateToken(String token);
}

class LocalDataManagerImpl extends LocalDataManager {
  final SharedPreferences _preferences;

  LocalDataManagerImpl(this._preferences);

  @override
  Future<String?> get token async {
    return _preferences.getString(PreferencesKey.KEY_TOKEN);
  }

  @override
  void updateToken(String token) {
    _preferences.setString(PreferencesKey.KEY_TOKEN, token);
  }
}

class PreferencesKey {
  PreferencesKey._();

  static const String KEY_TOKEN = "key_ture_protection_customer_token";
}
