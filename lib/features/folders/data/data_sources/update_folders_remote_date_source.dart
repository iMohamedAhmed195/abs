import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

abstract class UpdateFoldersRemoteDateSource {
  Future<ResponseModel> updateFolder({required NewFoldersModel newFoldersModel,required String id});
}

class UpdateFoldersRemoteDateSourceImpl extends RemoteExecuteImpl
    implements UpdateFoldersRemoteDateSource {
  UpdateFoldersRemoteDateSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> updateFolder({
    required NewFoldersModel newFoldersModel,required String id
  }) => updateData(
    endPoint: "${EndPoints.folders}/$id",
    getFromJsonFunction: FoldersResponseModel.fromJson,
    data: newFoldersModel.toJson(),
  );
}
