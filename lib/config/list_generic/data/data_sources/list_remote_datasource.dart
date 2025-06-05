import '../../../../exports.dart';

abstract class BaseListRemoteDataSource {
  Future<ResponseModel> getList({
    int? id,
    dynamic query,
  });
}

@protected
abstract class RemoteExecuteAbstract {
  Future<ResponseModel> getData({
    required String endPoint,
    required ResponseModel Function(Map<String, dynamic> data)
    getFromJsonFunction,
    dynamic query,
  });

  Future<ResponseModel> addData({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    required ResponseModel Function(Map<String, dynamic> data)
    getFromJsonFunction,
    bool isFormData = false,
    required Map<String, dynamic>? data,
  });

  Future<ResponseModel> updateData({
    required String endPoint,
    bool isFormData = false,
    required ResponseModel Function(Map<String, dynamic> data)
    getFromJsonFunction,
    required dynamic data,
  });

  Future<ResponseModel> deleteData({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    required ResponseModel Function(Map<String, dynamic> data)
    getFromJsonFunction,
  });
}

@protected
abstract class RemoteExecuteImpl extends RemoteExecuteAbstract {
  final DioConsumer dioConsumer;
  RemoteExecuteImpl({required this.dioConsumer});

  @override
  Future<ResponseModel> getData({
    required String endPoint,
    required ResponseModel Function(Map<String, dynamic> data)
    getFromJsonFunction,
    dynamic query,
  }) =>
      remoteExecute(
        request: dioConsumer.getRequest(
            path: endPoint,
            queryParams: query is Map ? query : query?.toJson()),
        fromJsonFunction: getFromJsonFunction,
      );

  @override
  Future<ResponseModel> addData({
    required String endPoint,
    required ResponseModel Function(Map<String, dynamic> data)
    getFromJsonFunction,
    bool isFormData = false,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
  }) =>
      remoteExecute(
        request: dioConsumer.postRequest(
            path: endPoint,
            body: data,
            isFormData: isFormData,
            queryParams: queryParams),
        fromJsonFunction: getFromJsonFunction,
      );

  @override
  Future<ResponseModel> updateData({
    required String endPoint,
    required ResponseModel Function(Map<String, dynamic> data)
    getFromJsonFunction,
    bool isFormData = false,
    required data,
  }) =>
      remoteExecute(
        request: dioConsumer.putRequest(
            path: endPoint, body: data, isFormData: isFormData),
        fromJsonFunction: getFromJsonFunction,
      );

  @override
  Future<ResponseModel> deleteData({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    required ResponseModel Function(Map<String, dynamic> data)
    getFromJsonFunction,
  }) =>
      remoteExecute(
        request:
        dioConsumer.deleteRequest(path: endPoint, queryParams: queryParams),
        fromJsonFunction: getFromJsonFunction,
      );
}
