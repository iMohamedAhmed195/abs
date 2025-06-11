
import 'package:new_ilearn/features/profile/data/data_sources/reports_remote_data_source.dart';
import 'package:new_ilearn/features/profile/domain/repos/reports_repo.dart';

import '../../../../exports.dart';

class ReportsRepoImp extends ReportsRepo{
  final ReportsRemoteDataSource remoteDataSource;
  ReportsRepoImp(this.remoteDataSource);
  @override
  Future<Either<Failure, ResponseModel>> getReports() =>executeImpl(() => remoteDataSource.getReports());

}