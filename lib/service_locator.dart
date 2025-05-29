import 'package:get_it/get_it.dart';

import 'exports.dart';
class ServiceLocator {
  GetIt getIt = GetIt.instance;

  /// Factory method that reuse same instance automatically

  static ServiceLocator instance = ServiceLocator._internal(); // named constructor

  /// Private constructor
  ServiceLocator._internal();
  factory ServiceLocator() => instance; // singleton
  Future<void> get init async {
    await registerPrefs;
    registerNetwork;
    registerPermission;

  }

  get registerNetwork {
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
    getIt.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
        request: true, requestBody: true, requestHeader: true, responseBody: true, responseHeader: true, error: true));
    getIt.registerLazySingleton<DioConsumer>(
        () => DioConsumer(client: getIt(), dioInterceptor: getIt(), logInterceptor: getIt())..dioInit());
    /*********************************** end of network  ****************************************/
  }
  get registerPrefs async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => preferences);
    getIt.registerLazySingleton<CacheAbstract>(() => CacheImpl(sharedPreferences: getIt<SharedPreferences>()));

  }
  get registerPermission => getIt.registerLazySingleton(() => PermissionManager());



}
