import 'package:new_ilearn/features/settings/domain/repos/policy_repo.dart';

import '../../../../exports.dart';

class GetPolicyUseCase {
  final PolicyRepo repo;

  GetPolicyUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getPolicy()  => repo.getPolicy();
}
