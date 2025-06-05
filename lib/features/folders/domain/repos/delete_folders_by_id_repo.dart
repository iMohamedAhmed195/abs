
import '../../../../exports.dart';

abstract class
DeleteFoldersByIdRepo {
  Future<Either<Failure, ResponseModel>> deleteFoldersById({required String id});
}