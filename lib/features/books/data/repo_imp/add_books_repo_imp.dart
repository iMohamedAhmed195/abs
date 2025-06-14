import 'package:new_ilearn/features/books/data/data_sources/add_books_remote_date_source.dart';
import 'package:new_ilearn/features/books/data/models/add_books_request_model.dart';
import 'package:new_ilearn/features/books/domain/repos/add_books_repo.dart';

import '../../../../exports.dart';

class AddBooksRepoImp extends AddBooksRepo {
  final AddBooksRemoteDateSource remoteDataSource;

  AddBooksRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> addBook({required AddBooksRequestModel addBooksRequestModel}) =>
      (executeImpl(() => remoteDataSource.addBook(addBooksRequestModel: addBooksRequestModel)));
}
