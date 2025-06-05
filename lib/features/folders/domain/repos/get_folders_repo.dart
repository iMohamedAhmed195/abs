
import '../../../../exports.dart';

abstract class GetFoldersRepo {
  Future<Either<Failure, ResponseModel>> getFolders();
}