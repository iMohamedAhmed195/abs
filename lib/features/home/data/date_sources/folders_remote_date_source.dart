
import 'package:new_ilearn/features/home/data/models/folders_model.dart';

import '../../../../exports.dart';

abstract class FoldersRemoteDataSource {
  Future<ResponseModel> getFolders();
}
class FoldersRemoteDataSourceImpl extends  RemoteExecuteImpl  implements FoldersRemoteDataSource {
  FoldersRemoteDataSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getFolders() =>getData(endPoint: EndPoints.folders , getFromJsonFunction: FoldersResponseModel.fromJson);
  
}