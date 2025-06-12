import '../../../../exports.dart';

abstract class PolicyRepo {
  Future <Either<Failure, ResponseModel>> getPolicy();
}