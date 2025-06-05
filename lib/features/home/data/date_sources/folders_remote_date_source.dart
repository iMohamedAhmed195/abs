
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

abstract class FoldersRemoteDataSource {
  Future<ResponseModel> getFolders();
}
class FoldersRemoteDataSourceImpl extends  RemoteExecuteImpl  implements FoldersRemoteDataSource {
  FoldersRemoteDataSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getFolders() =>getData(endPoint: EndPoints.homeFolders , getFromJsonFunction: HomeFoldersResponseModel.fromJson);
  
}