import 'package:new_ilearn/exports.dart';

abstract class HowWeWorkRepo {
  Future<Either<Failure, ResponseModel>> getHowWeWork();
}