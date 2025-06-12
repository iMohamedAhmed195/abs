
import 'package:new_ilearn/features/settings/data/date_sources/policy_remote_data_source.dart';
import 'package:new_ilearn/features/settings/domain/repos/policy_repo.dart';

import '../../../../exports.dart';

class PolicyRepoImp extends PolicyRepo{
  final PolicyRemoteDataSource remoteDataSource;
  PolicyRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getPolicy() => executeImpl(() => remoteDataSource.getPolicy());
}