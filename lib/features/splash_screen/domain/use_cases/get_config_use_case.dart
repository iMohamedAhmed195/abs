
import 'package:new_ilearn/exports.dart';

import '../repositories/get_config_repo.dart';

class GetConfigUseCase {
  final GetConfigRepo getConfigRepo;
  GetConfigUseCase({required this.getConfigRepo});
  Future<Either<Failure, ResponseModel>> getConfig() => getConfigRepo.getConfig();
}
