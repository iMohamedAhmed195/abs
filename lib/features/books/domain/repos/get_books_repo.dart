
import '../../../../exports.dart';

abstract class GetBooksRepo {
  Future<Either<Failure, ResponseModel>> getBooks({required String categoryId});
}