import 'package:get_it/get_it.dart';
import 'package:new_ilearn/core/utils/theme/theme_cubit.dart';
import 'package:new_ilearn/features/auth/data/data_source/local_auth_data_source.dart';
import 'package:new_ilearn/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:new_ilearn/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:new_ilearn/features/auth/domain/repositories/auth_repo.dart';
import 'package:new_ilearn/features/auth/domain/usecase/auth_use_case.dart';
import 'package:new_ilearn/features/auth/presentation/managers/auth_cubit.dart';
import 'package:new_ilearn/features/books/data/data_sources/add_books_remote_date_source.dart';
import 'package:new_ilearn/features/books/data/data_sources/get_books_remote_date_source.dart';
import 'package:new_ilearn/features/books/data/repo_imp/add_books_repo_imp.dart';
import 'package:new_ilearn/features/books/data/repo_imp/get_books_repo_imp.dart';
import 'package:new_ilearn/features/books/domain/repos/add_books_repo.dart';
import 'package:new_ilearn/features/books/domain/repos/get_books_repo.dart';
import 'package:new_ilearn/features/books/domain/use_cases/add_books_use_case.dart';
import 'package:new_ilearn/features/books/domain/use_cases/get_books_use_case.dart';
import 'package:new_ilearn/features/books/presentation/managers/get_books_cubit.dart';
import 'package:new_ilearn/features/folders/data/data_sources/add_folders_remote_date_source.dart';
import 'package:new_ilearn/features/folders/data/data_sources/delete_folder_by_id_remote_date_source.dart';
import 'package:new_ilearn/features/folders/data/data_sources/get_folder_by_id_remote_date_source.dart';
import 'package:new_ilearn/features/folders/data/data_sources/get_folders_remote_date_source.dart';
import 'package:new_ilearn/features/folders/data/data_sources/update_folders_remote_date_source.dart';
import 'package:new_ilearn/features/folders/data/repo_imp/delete_folder_by_id_repo_imp.dart';
import 'package:new_ilearn/features/folders/data/repo_imp/get_folders_repo_imp.dart';
import 'package:new_ilearn/features/folders/data/repo_imp/update_folders_repo_imp.dart';
import 'package:new_ilearn/features/folders/domain/repos/add_folders_repo.dart';
import 'package:new_ilearn/features/folders/domain/repos/delete_folders_by_id_repo.dart';
import 'package:new_ilearn/features/folders/domain/repos/get_folders_repo.dart';
import 'package:new_ilearn/features/folders/domain/repos/update_folders_repo.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/delete_folder_by_id_use_case.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/get_folders_use_case.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/update_folders_use_case.dart';
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
import 'package:new_ilearn/features/profile/data/data_sources/update_profile_remote_data_source.dart';
import 'package:new_ilearn/features/profile/data/repo_imp/update_profile_repo_imp.dart';
import 'package:new_ilearn/features/profile/domain/repos/update_profile_repo.dart';
import 'package:new_ilearn/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:new_ilearn/features/splash_screen/data/data_sources/get_config_local_data_source.dart';
import 'package:new_ilearn/features/splash_screen/data/data_sources/get_config_remote_data_source.dart';
import 'package:new_ilearn/features/splash_screen/data/repositories/get_config_repo_impl.dart';
import 'package:new_ilearn/features/splash_screen/domain/repositories/get_config_repo.dart';
import 'package:new_ilearn/features/splash_screen/domain/use_cases/get_config_use_case.dart';
import 'package:new_ilearn/features/splash_screen/presentation/manager/get_configration_cubit.dart';

import 'exports.dart';
import 'features/folders/data/repo_imp/add_folders_repo_imp.dart';
import 'features/folders/domain/use_cases/add_folders_use_case.dart';
class ServiceLocator {
  GetIt getIt = GetIt.instance;

  /// Factory method that reuse same instance automatically

  static ServiceLocator instance = ServiceLocator
      ._internal(); // named constructor

  /// Private constructor
  ServiceLocator._internal();

  factory ServiceLocator() => instance; // singleton
  Future<void> get init async {
    await registerPrefs;
    registerNetwork;
    registerPermission;
    registerAuthDependencies;
    registerConfig;
    registerHomeFolders;
    registerHomeGroupChats;
    registerHomeStatistics;
    registerDeleteFolderFeatures;
    registerUpdateFolderFeatures;
    registerGetFolderByIdFeatures;
    registerGetFoldersFeatures;
    registerAddFoldersFeatures;
    registerGetBooksFeatures;
    registerAddBooksFeatures;
    registerTheme;
    registerUpdateProfile;
  }

  get registerNetwork {
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
    getIt.registerLazySingleton<LogInterceptor>(() =>
        LogInterceptor(
            request: true,
            requestBody: true,
            requestHeader: true,
            responseBody: true,
            responseHeader: true,
            error: true));
    getIt.registerLazySingleton<DioConsumer>(
            () =>
        DioConsumer(
            client: getIt(), dioInterceptor: getIt(), logInterceptor: getIt())
          ..dioInit());
    /*********************************** end of network  ****************************************/
  }

  get registerPrefs async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => preferences);
    getIt.registerLazySingleton<CacheAbstract>(() =>
        CacheImpl(sharedPreferences: getIt<SharedPreferences>()));
  }

  get registerPermission =>
      getIt.registerLazySingleton(() => PermissionManager());

  get registerAuthDependencies {
    getIt.registerLazySingleton<AuthLocalDataSource>(() =>
        AuthLocalDataSourceImpl(cache: getIt()));
    getIt.registerLazySingleton<AuthRemoteDataSource>(() =>
        AuthRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<AuthRepo>(() =>
        AuthRepoImpl(
        authLocalDataSource: getIt(), authRemoteDataSource: getIt()));
    getIt.registerLazySingleton<AuthUseCase>(() =>
        AuthUseCase(authRepo: getIt()));
    getIt.registerLazySingleton<AuthCubit>(() =>
        AuthCubit(authUseCase: getIt()));
  }

  get registerConfig {
    getIt.registerLazySingleton<GetConfigurationLocalDataSource>(() =>
        GetConfigurationLocalDataSourceImpl(cache: getIt()));
    getIt.registerLazySingleton<GetConfigRemoteDataSource>(() =>
        GetConfigRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<GetConfigRepo>(() =>
        GetConfigRepoImpl(
        getConfigLocalDataSource: getIt(),
        getConfigRemoteDataSource: getIt()));
    getIt.registerLazySingleton<GetConfigUseCase>(() =>
        GetConfigUseCase(getConfigRepo: getIt()));
    getIt.registerLazySingleton<ConfigurationCubit>(() =>
        ConfigurationCubit(getConfigUseCase: getIt()));
  }

  get registerHomeStatistics {
    getIt.registerLazySingleton<StatisticsRemoteDateSource>(() =>
        StatisticsRemoteDateSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<StatisticsRepo>(
            () => StatisticsRepoImp(remoteDataSource: getIt(),));
    getIt.registerLazySingleton<GetStatisticsUseCase>(() =>
        GetStatisticsUseCase(repo: getIt()));
  }

  get registerHomeGroupChats {
    getIt.registerLazySingleton<GroupsChatRemoteDateSource>(() =>
        GroupsChatRemoteDateSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<GroupsChatRepo>(() => GroupsChatRepoImp(remoteDataSource: getIt(),));
    getIt.registerLazySingleton<GetGroupsChatUseCase>(() =>
        GetGroupsChatUseCase(repo: getIt()));
  }

  get registerHomeFolders {
    getIt.registerLazySingleton<FoldersRemoteDataSource>(() =>
        FoldersRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<FoldersRepo>(() => FoldersRepoImp(remoteDataSource: getIt(),  ));
    getIt.registerLazySingleton<GetHomeFoldersUseCase>(() => GetHomeFoldersUseCase(repo: getIt()));
  }
  get registerGetBooks{
    getIt.registerLazySingleton<FoldersRemoteDataSource>(() => FoldersRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<FoldersRepo>(() => FoldersRepoImp(remoteDataSource: getIt(),));
    getIt.registerLazySingleton<GetHomeFoldersUseCase>(() =>
        GetHomeFoldersUseCase(repo: getIt()));
  }

  get registerAddFoldersFeatures {
    getIt.registerLazySingleton<AddFoldersRemoteDateSource>(() =>
        AddFoldersRemoteDateSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<AddFoldersRepo>(() => AddFoldersRepoImp(remoteDataSource: getIt(),));
    getIt.registerLazySingleton<AddFoldersUseCase>(() =>
        AddFoldersUseCase(repo: getIt()));
  }
  get registerAddBooksFeatures {
    getIt.registerLazySingleton<AddBooksRemoteDateSource>(() => AddBooksRemoteDateSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<AddBooksRepo>(() => AddBooksRepoImp(remoteDataSource: getIt(),  ));
    getIt.registerLazySingleton<AddBooksUseCase>(() => AddBooksUseCase(repo: getIt()));
  }

  get registerGetFoldersFeatures {
    getIt.registerLazySingleton<GetFoldersRemoteDataSource>(() => GetFoldersRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<GetFoldersRepo>(() => GetFoldersRepoImp(remoteDataSource: getIt(),  ));
    getIt.registerLazySingleton<GetFoldersUseCase>(() => GetFoldersUseCase(repo: getIt()));
  }
  get registerGetBooksFeatures {
    getIt.registerLazySingleton<GetBooksRemoteDataSource>(() => GetBooksRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<GetBooksRepo>(() => GetBooksRepoImp(getBooksRemoteDataSource: getIt(),  ));
    getIt.registerLazySingleton<GetBooksUseCase>(() => GetBooksUseCase(repo: getIt()));
    getIt.registerLazySingleton<GetBooksCubit>(() => GetBooksCubit(useCase: getIt()));
  }  get registerGetFolderByIdFeatures {
    getIt.registerLazySingleton<GetFolderByIdRemoteDateSource>(() => GetFolderByIdRemoteDateSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<GetFoldersRemoteDataSource>(() =>
        GetFoldersRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<GetFoldersRepo>(
            () => GetFoldersRepoImp(remoteDataSource: getIt(),));
    getIt.registerLazySingleton<GetFoldersUseCase>(() =>
        GetFoldersUseCase(repo: getIt()));
  }

  get registerUpdateFolderFeatures {
    getIt.registerLazySingleton<UpdateFoldersRemoteDateSource>(() =>
        UpdateFoldersRemoteDateSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<UpdateFoldersRepo>(
            () => UpdateFoldersRepoImp(remoteDataSource: getIt(),));
    getIt.registerLazySingleton<UpdateFoldersUseCase>(() =>
        UpdateFoldersUseCase(repo: getIt()));
  }

  get registerDeleteFolderFeatures {
    getIt.registerLazySingleton<DeleteFolderByIdRemoteDateSource>(() =>
        DeleteFolderByIdRemoteDateSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<DeleteFoldersByIdRepo>(
            () => DeleteFolderByIdRepoImp(remoteDataSource: getIt(),));
    getIt.registerLazySingleton<DeleteFolderByIdUseCase>(() =>
        DeleteFolderByIdUseCase(repo: getIt()));
  }

  get registerTheme {
    getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
   }
   get registerUpdateProfile {
    getIt.registerLazySingleton<UpdateProfileRemoteDataSource>(() =>
         UpdateProfileRemoteDataSourceImp(dioConsumer: getIt()));
    getIt.registerLazySingleton<UpdateProfileRepo>(
            () => UpdateProfileRepoImp(remoteDataSource: getIt(),));
    getIt.registerLazySingleton<UpdateProfileUseCase>(() =>
        UpdateProfileUseCase(repo: getIt()));
   }
}