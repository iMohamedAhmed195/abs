import 'package:new_ilearn/features/settings/data/date_sources/app_versions_remote_data_source.dart';
import 'package:new_ilearn/features/settings/domain/repos/app_versions_repo.dart';

import '../../../../exports.dart';

class AppVersionsRepoImp extends AppVersionsRepo{
  final AppVersionsRemoteDataSource remoteDataSource;
  AppVersionsRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getAppVersions() => executeImpl(() => remoteDataSource.getAppVersions());
}