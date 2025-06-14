
import '../../../../exports.dart';

abstract class
DeleteBooksByIdRepo {
  Future<Either<Failure, ResponseModel>> deleteBooksById({required String id});
}