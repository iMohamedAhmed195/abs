import 'package:get_it/get_it.dart';
import 'package:new_ilearn/features/auth/data/data_source/local_auth_data_source.dart';
import 'package:new_ilearn/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:new_ilearn/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:new_ilearn/features/auth/domain/repositories/auth_repo.dart';
import 'package:new_ilearn/features/auth/domain/usecase/auth_use_case.dart';
import 'package:new_ilearn/features/auth/presentation/managers/auth_cubit.dart';
import 'package:new_ilearn/features/splash_screen/data/data_sources/get_config_local_data_source.dart';
import 'package:new_ilearn/features/splash_screen/data/data_sources/get_config_remote_data_source.dart';
import 'package:new_ilearn/features/splash_screen/data/repositories/get_config_repo_impl.dart';
import 'package:new_ilearn/features/splash_screen/domain/repositories/get_config_repo.dart';
import 'package:new_ilearn/features/splash_screen/domain/use_cases/get_config_use_case.dart';
import 'package:new_ilearn/features/splash_screen/presentation/manager/get_configration_cubit.dart';

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
    registerAuthDependencies;
    registerConfig;
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

  get registerAuthDependencies {
    getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(cache: getIt()));
    getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(authLocalDataSource: getIt(), authRemoteDataSource: getIt()));
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCase(authRepo: getIt()));
    getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(authUseCase: getIt()));
  }
  get registerConfig {
    getIt.registerLazySingleton<GetConfigurationLocalDataSource>(() => GetConfigurationLocalDataSourceImpl(cache: getIt()));
    getIt.registerLazySingleton<GetConfigRemoteDataSource>(() => GetConfigRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<GetConfigRepo>(() =>GetConfigRepoImpl(getConfigLocalDataSource: getIt(), getConfigRemoteDataSource: getIt()));
    getIt.registerLazySingleton<GetConfigUseCase>(() => GetConfigUseCase(getConfigRepo: getIt()));
    getIt.registerLazySingleton<ConfigurationCubit>(() => ConfigurationCubit(getConfigUseCase: getIt()));
  }

}
