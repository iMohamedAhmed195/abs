import 'package:new_ilearn/features/profile/data/data_sources/update_profile_remote_data_source.dart';
import 'package:new_ilearn/features/profile/data/models/profile_model.dart';
import 'package:new_ilearn/features/profile/domain/repos/update_profile_repo.dart';

import '../../../../exports.dart';

class UpdateProfileRepoImp extends UpdateProfileRepo {
  final UpdateProfileRemoteDataSource remoteDataSource;
  UpdateProfileRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> updateProfile({required ProfileModel profileModel}) =>executeImpl(() => remoteDataSource.updateProfile(profileModel: profileModel));

}