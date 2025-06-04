import 'package:get_it/get_it.dart';
import 'package:new_ilearn/features/auth/data/data_source/local_auth_data_source.dart';
import 'package:new_ilearn/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:new_ilearn/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:new_ilearn/features/auth/domain/repositories/auth_repo.dart';
import 'package:new_ilearn/features/auth/domain/usecase/auth_use_case.dart';
import 'package:new_ilearn/features/auth/presentation/managers/auth_cubit.dart';
import 'package:new_ilearn/features/home/data/date_sources/folders_remote_date_source.dart';
import 'package:new_ilearn/features/home/data/date_sources/groups_chat_remote_date_source.dart';
import 'package:new_ilearn/features/home/data/date_sources/statistics_remote_date_source.dart';
import 'package:new_ilearn/features/home/data/repo_imp/folders_repo_imp.dart';
import 'package:new_ilearn/features/home/data/repo_imp/groups_chat_repo_imp.dart';
import 'package:new_ilearn/features/home/data/repo_imp/statistics_repo_imp.dart';
import 'package:new_ilearn/features/home/domain/repos/folders_repo.dart';
import 'package:new_ilearn/features/home/domain/repos/groups_chat_repo.dart';
import 'package:new_ilearn/features/home/domain/repos/statistics_repo.dart';
import 'package:new_ilearn/features/home/domain/use_cases/get_folders_use_case.dart';
import 'package:new_ilearn/features/home/domain/use_cases/get_groups_chat_use_case.dart';
import 'package:new_ilearn/features/home/domain/use_cases/get_statistics_use_case.dart';

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
    registerHomeFolders;
    registerHomeGroupChats;
    registerHomeStatistics;
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
    getIt.registerLazySingleton<AuthRepo>(
            () => AuthRepoImpl(authLocalDataSource: getIt(), authRemoteDataSource: getIt()));
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCase(authRepo: getIt()));
    getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(authUseCase: getIt()));
  }
  get registerHomeStatistics {
    getIt.registerLazySingleton<StatisticsRemoteDateSource>(() => StatisticsRemoteDateSourceImpl(dioConsumer: getIt()));
     getIt.registerLazySingleton<StatisticsRepo>(
            () => StatisticsRepoImp(remoteDataSource: getIt(),  ));
    getIt.registerLazySingleton<GetStatisticsUseCase>(() => GetStatisticsUseCase(repo: getIt()));
   }
  get registerHomeGroupChats {
    getIt.registerLazySingleton<GroupsChatRemoteDateSource>(() => GroupsChatRemoteDateSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<GroupsChatRepo>(
            () => GroupsChatRepoImp(remoteDataSource: getIt(),  ));
    getIt.registerLazySingleton<GetGroupsChatUseCase>(() => GetGroupsChatUseCase(repo: getIt()));
  }  get registerHomeFolders{
    getIt.registerLazySingleton<FoldersRemoteDataSource>(() => FoldersRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<FoldersRepo>(
            () => FoldersRepoImp(remoteDataSource: getIt(),  ));
    getIt.registerLazySingleton<GetFoldersUseCase>(() => GetFoldersUseCase(repo: getIt()));
  }

}
