import 'package:new_ilearn/features/home/data/repo_imp/folders_repo_imp.dart';
import 'package:new_ilearn/features/home/domain/repos/statistics_repo.dart';

import '../../../../exports.dart';

class GetStatisticsUseCase {
  final StatisticsRepo repo;
  GetStatisticsUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getStatistics({String? reportType}) => repo.getStatistics(reportType: reportType);
}