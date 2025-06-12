import '../../../../exports.dart';

abstract class PolicyRemoteDataSource {
  Future<ResponseModel> getPolicy();
}
class PolicyRemoteDataSourceImp extends RemoteExecuteImpl implements PolicyRemoteDataSource {
  PolicyRemoteDataSourceImp({required super.dioConsumer});

  @override
  Future<ResponseModel> getPolicy()=> getData(endPoint: EndPoints.policy, getFromJsonFunction: ResponseModel.fromJson);

}