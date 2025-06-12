import '../../../../exports.dart';

abstract class AppVersionsRepo {
  Future <Either<Failure, ResponseModel>> getAppVersions();
}