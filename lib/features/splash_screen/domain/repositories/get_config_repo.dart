

import '../../../../exports.dart';

abstract class GetConfigRepo {
  Future<Either<Failure, ResponseModel>> getConfig();
}
