import 'package:new_ilearn/features/profile/domain/repos/reports_repo.dart';

import '../../../../exports.dart';

class GetReportsUseCase {
  final ReportsRepo repo;

  GetReportsUseCase({required this.repo});
  Future<Either<Failure, ResponseModel>> getReports() => repo.getReports();
}