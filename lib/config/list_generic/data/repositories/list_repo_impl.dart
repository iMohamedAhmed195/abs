

import '../../../../exports.dart';


class ListRepoImpl extends ListRepo {
  BaseListRemoteDataSource baseListRemoteDataSource;
  ListRepoImpl({required this.baseListRemoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getList({int? id, query}) =>
      executeImpl(() => baseListRemoteDataSource.getList(query: query));
}
