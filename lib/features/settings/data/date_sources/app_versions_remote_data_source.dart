import '../../../../exports.dart';

abstract class AppVersionsRemoteDataSource {
  Future<ResponseModel> getAppVersions();
}
class AppVersionsRemoteDataSourceImp extends RemoteExecuteImpl implements AppVersionsRemoteDataSource {
  AppVersionsRemoteDataSourceImp({required super.dioConsumer});

  @override
  Future<ResponseModel> getAppVersions()=> getData(endPoint: EndPoints.appVersions, getFromJsonFunction: ResponseModel.fromJson);

}