
import 'package:new_ilearn/features/books/data/models/add_books_request_model.dart';

import '../../../../exports.dart';

abstract class AddBooksRepo {
  Future<Either<Failure, ResponseModel>> addBook({required AddBooksRequestModel addBooksRequestModel});
}