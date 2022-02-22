import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:true_protection_customer/src/data/api/DioClient.dart';
import 'package:true_protection_customer/src/data/api/service/AuthApiService.dart';
import 'package:true_protection_customer/src/data/local/LocalDataManger.dart';
import 'package:true_protection_customer/src/di/module/AppModule.dart';
import 'package:true_protection_customer/src/di/module/NetworkModule.dart';
import 'package:true_protection_customer/src/domain/respository/AuthRepository.dart';

final getIt = GetIt.instance;

Future<void> setUpDI() async {
  // async singleton
  getIt.registerSingletonAsync<SharedPreferences>(
      () => AppModule.provideSharedPreferences());

  // register singleton
  getIt.registerSingleton<LocalDataManagerImpl>(
    LocalDataManagerImpl(await getIt.getAsync<SharedPreferences>()),
  );
  // network module
  getIt.registerSingleton<Dio>(
    NetworkModule.provideDao(
      getIt.get<LocalDataManagerImpl>(),
    ),
  );

  // dio client
  getIt.registerSingleton<DioClient>(
    DioClient(
      getIt.get<Dio>(),
    ),
  );

  // api service instance
  getIt.registerSingleton<AuthApiService>(
    AuthApiService(
      getIt.get<DioClient>(),
    ),
  );

  // repository instance
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(
      getIt.get<AuthApiService>(),
      getIt.get<LocalDataManagerImpl>(),
    ),
  );

  // app dependencies
  AppModule.dependencies();
}
