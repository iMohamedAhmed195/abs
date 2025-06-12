import '../../../../exports.dart';

abstract class TermsRepo {
  Future <Either<Failure, ResponseModel>> getTerms();
}