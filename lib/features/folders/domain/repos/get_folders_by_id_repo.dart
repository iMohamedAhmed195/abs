
import '../../../../exports.dart';

abstract class
GetFoldersByIdRepo {
  Future<Either<Failure, ResponseModel>> getFolderById({required String id});
}