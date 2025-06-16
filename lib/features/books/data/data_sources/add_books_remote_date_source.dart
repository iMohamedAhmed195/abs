import 'package:new_ilearn/features/books/data/models/add_books_request_model.dart';
import '../../../../exports.dart';

abstract class AddBooksRemoteDateSource {
  Future<ResponseModel> addBook({required AddBooksRequestModel addBooksRequestModel});
}

class AddBooksRemoteDateSourceImpl extends RemoteExecuteImpl implements AddBooksRemoteDateSource {
  AddBooksRemoteDateSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> addBook({required AddBooksRequestModel addBooksRequestModel}) => addData(
    endPoint: EndPoints.books,
    getFromJsonFunction: ResponseModel.fromJson,
    data: addBooksRequestModel.toJson(),
    isFormData: true,
  );
}
