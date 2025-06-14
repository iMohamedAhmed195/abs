
import '../../../../exports.dart';
import '../repos/get_books_repo.dart';

class GetBooksUseCase {
  final GetBooksRepo repo;
  GetBooksUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getBooks({required String categoryId})  => repo.getBooks(categoryId: categoryId);
}