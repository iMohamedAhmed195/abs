
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';
import 'package:new_ilearn/features/home/data/models/statistics_model.dart';

import '../../../../exports.dart';

abstract class StatisticsRemoteDateSource {
  Future<ResponseModel> getStatistics();
}
class StatisticsRemoteDateSourceImpl extends  RemoteExecuteImpl  implements StatisticsRemoteDateSource {
  StatisticsRemoteDateSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getStatistics() =>getData(endPoint: EndPoints.statistics , getFromJsonFunction: StatisticsResponseModel.fromJson);
  
}