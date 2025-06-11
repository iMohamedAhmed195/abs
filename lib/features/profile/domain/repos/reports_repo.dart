import '../../../../exports.dart';

abstract class ReportsRepo {
  Future<Either<Failure, ResponseModel>> getReports( );
}