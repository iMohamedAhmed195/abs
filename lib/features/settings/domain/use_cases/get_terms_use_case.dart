import 'package:new_ilearn/features/settings/domain/repos/terms_repo.dart';

import '../../../../exports.dart';

class GetTermsUseCase {
  final TermsRepo repo;

  GetTermsUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getTerms()  => repo.getTerms();
}
