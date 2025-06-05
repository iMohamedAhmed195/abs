
import '../../../../exports.dart';

abstract class FoldersRepo {
  Future<Either<Failure, ResponseModel>> getFolders();
}