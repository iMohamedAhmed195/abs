
import '../../../../exports.dart';

abstract class
GetBooksByIdRepo {
  Future<Either<Failure, ResponseModel>> getBooksById({required String id});
}