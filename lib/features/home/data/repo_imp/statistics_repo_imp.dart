import 'package:new_ilearn/features/home/data/date_sources/folders_remote_date_source.dart';
import 'package:new_ilearn/features/home/data/date_sources/statistics_remote_date_source.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';
import 'package:new_ilearn/features/home/domain/repos/folders_repo.dart';
import 'package:new_ilearn/features/home/domain/repos/statistics_repo.dart';

import '../../../../exports.dart';

class StatisticsRepoImp extends StatisticsRepo {
  final StatisticsRemoteDateSource remoteDataSource;

  StatisticsRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getStatistics ({String? reportType}) =>
      (executeImpl(() => remoteDataSource.getStatistics(reportType: reportType)));
}
