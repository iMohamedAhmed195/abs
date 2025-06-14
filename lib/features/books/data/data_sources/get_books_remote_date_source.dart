import 'package:new_ilearn/features/books/data/models/get_books_model.dart';

import '../../../../exports.dart';

abstract class GetBooksRemoteDataSource {
  Future<ResponseModel> getBooks({required String categoryId});
}

class GetBooksRemoteDataSourceImpl extends RemoteExecuteImpl implements GetBooksRemoteDataSource {
  GetBooksRemoteDataSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getBooks({required String categoryId}) =>
      getData(endPoint: EndPoints.books,
          query: {
            'categoryId': categoryId
          },
          getFromJsonFunction: GetBooksResponseModel.fromJson);
}
