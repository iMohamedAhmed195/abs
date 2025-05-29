
import '../../../../exports.dart';

abstract class ListRepo<T extends ResponseModel> {
  Future<Either<Failure, T>> getList({int? id, dynamic query});
}
