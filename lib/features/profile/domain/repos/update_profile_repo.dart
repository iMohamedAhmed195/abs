import 'package:new_ilearn/features/profile/data/models/profile_model.dart';

import '../../../../exports.dart';

abstract class UpdateProfileRepo {
  Future<Either<Failure, ResponseModel>> updateProfile({required ProfileModel  profileModel});
}