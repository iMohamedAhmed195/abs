import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/bottom_navigation/domain/repos/terms_and_condition_repo.dart';

 class TermsAndConditionUseCase {
 final TermsAndConditionRepo termsAndConditionRepo;

 TermsAndConditionUseCase({required this.termsAndConditionRepo});

  Future<Either<Failure, ResponseModel>> getTermsAndCondition()=> termsAndConditionRepo.getTermsAndCondition();
}