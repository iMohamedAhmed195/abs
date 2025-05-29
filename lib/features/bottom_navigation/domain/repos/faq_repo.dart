import 'package:new_ilearn/exports.dart';

abstract class FaqRepo {
  Future<Either<Failure, ResponseModel>> getFaq();
}