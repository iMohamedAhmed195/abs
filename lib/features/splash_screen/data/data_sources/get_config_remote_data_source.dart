
import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/splash_screen/data/models/config_response_model.dart';

abstract class GetConfigRemoteDataSource {
  Future<ResponseModel> getConfig();
}

class GetConfigRemoteDataSourceImpl extends GetConfigRemoteDataSource {
  final DioConsumer dioConsumer;
  GetConfigRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<ResponseModel> getConfig() =>
      remoteExecute(request: dioConsumer.getRequest(path: EndPoints.config), fromJsonFunction: ConfigResponseModel.fromJson);
}
