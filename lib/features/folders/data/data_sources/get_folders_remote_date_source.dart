
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

abstract class GetFoldersRemoteDataSource {
  Future<ResponseModel> getFolders();
}
class GetFoldersRemoteDataSourceImpl extends  RemoteExecuteImpl  implements GetFoldersRemoteDataSource {
  GetFoldersRemoteDataSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getFolders() =>getData(endPoint: EndPoints.folders , getFromJsonFunction: FoldersResponseModel.fromJson);
  
}