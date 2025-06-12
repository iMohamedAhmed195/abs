 import 'package:new_ilearn/features/settings/data/date_sources/terms_remote_data_source.dart';
import 'package:new_ilearn/features/settings/domain/repos/terms_repo.dart';

import '../../../../exports.dart';

class TermsRepoImp extends TermsRepo{
  final TermsRemoteDataSource remoteDataSource;
  TermsRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getTerms() => executeImpl(() => remoteDataSource.getTerms());
}