import 'package:new_ilearn/features/books/data/models/add_books_request_model.dart';
import 'package:new_ilearn/features/books/domain/repos/add_books_repo.dart';
import '../../../../exports.dart';

class AddBooksUseCase {
  final AddBooksRepo repo;
  AddBooksUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getBooks({required AddBooksRequestModel addBooksRequestModel})  => repo.addBook(addBooksRequestModel: addBooksRequestModel);
}