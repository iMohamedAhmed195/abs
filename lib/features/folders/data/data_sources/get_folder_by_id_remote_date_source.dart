
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

abstract class GetFolderByIdRemoteDateSource {
  Future<ResponseModel> getFolderById({required String id});
}
class GetFolderByIdRemoteDateSourceImpl extends  RemoteExecuteImpl  implements GetFolderByIdRemoteDateSource {
  GetFolderByIdRemoteDateSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getFolderById({required String id}) =>getData(endPoint:"${EndPoints.folders}/$id" , getFromJsonFunction: FoldersResponseModel.fromJson);
  
}