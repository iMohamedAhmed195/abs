import 'package:new_ilearn/features/profile/data/models/reports_model.dart';

import '../../../../exports.dart';

abstract class ReportsRemoteDataSource {
  Future<ResponseModel> getReports();
}
class  ReportsRemoteDataSourceImp  extends RemoteExecuteImpl implements ReportsRemoteDataSource {
  ReportsRemoteDataSourceImp({required super.dioConsumer});

  @override
  Future<ResponseModel> getReports() =>getData(endPoint: EndPoints.reports, getFromJsonFunction: ReportsResponseModel.fromJson);
}