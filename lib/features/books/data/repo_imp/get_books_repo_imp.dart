



import '../../../../exports.dart';
import '../../domain/repos/get_books_repo.dart';
import '../data_sources/get_books_remote_date_source.dart';

class GetBooksRepoImp extends GetBooksRepo {
  final GetBooksRemoteDataSource getBooksRemoteDataSource;

  GetBooksRepoImp({required this.getBooksRemoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getBooks({required String categoryId}) =>
      (executeImpl(() => getBooksRemoteDataSource.getBooks(categoryId: categoryId)));
}
