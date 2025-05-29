import 'package:new_ilearn/exports.dart';

abstract class TermsAndConditionRepo {
  Future<Either<Failure, ResponseModel>> getTermsAndCondition();
}