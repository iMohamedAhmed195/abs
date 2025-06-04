import 'package:new_ilearn/features/home/data/models/folders_model.dart';

import '../../../../exports.dart';

abstract class StatisticsRepo {
  Future<Either<Failure, ResponseModel>> getStatistics();
}