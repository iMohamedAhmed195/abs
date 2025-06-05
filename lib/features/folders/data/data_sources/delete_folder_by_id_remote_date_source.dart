
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

abstract class DeleteFolderByIdRemoteDateSource {
  Future<ResponseModel> deleteFolderById({required String id});
}
class DeleteFolderByIdRemoteDateSourceImpl extends  RemoteExecuteImpl  implements DeleteFolderByIdRemoteDateSource {
  DeleteFolderByIdRemoteDateSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> deleteFolderById({required String id}) =>deleteData(endPoint:"${EndPoints.folders}/$id" , getFromJsonFunction: FoldersResponseModel.fromJson);
  
}