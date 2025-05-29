
import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/splash_screen/data/data_sources/get_config_local_data_source.dart';
import 'package:new_ilearn/features/splash_screen/data/data_sources/get_config_remote_data_source.dart';
import 'package:new_ilearn/features/splash_screen/data/models/config_response_model.dart';

import '../../domain/repositories/get_config_repo.dart';

class GetConfigRepoImpl extends GetConfigRepo {
  final GetConfigRemoteDataSource getConfigRemoteDataSource;
  final GetConfigurationLocalDataSource getConfigLocalDataSource;
  GetConfigRepoImpl({required this.getConfigRemoteDataSource, required this.getConfigLocalDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getConfig() => executeImpl<ConfigData>(
        () => getConfigRemoteDataSource.getConfig(),
        localRead: () => getConfigLocalDataSource.getData(),
        localWrite: (data) => getConfigLocalDataSource.storeData(data),
      );
}
