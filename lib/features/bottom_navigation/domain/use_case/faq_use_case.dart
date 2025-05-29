import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/bottom_navigation/domain/repos/faq_repo.dart';

 class FaqUseCase {
 final FaqRepo faqRepo;

 FaqUseCase({required this.faqRepo});

  Future<Either<Failure, ResponseModel>> getFaq()=> faqRepo.getFaq();
}