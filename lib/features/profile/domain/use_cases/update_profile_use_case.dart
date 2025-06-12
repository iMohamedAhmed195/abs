import 'package:new_ilearn/features/profile/data/models/profile_model.dart';
import 'package:new_ilearn/features/profile/domain/repos/update_profile_repo.dart';

import '../../../../exports.dart';

class UpdateProfileUseCase {
  final UpdateProfileRepo repo;
  UpdateProfileUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> updateProfile({
    required ProfileModel profileModel,
  }) {
    return repo.updateProfile(profileModel: profileModel);
  }
}
