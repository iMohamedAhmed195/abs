import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

abstract class AddFoldersRemoteDateSource {
  Future<ResponseModel> addFolder({required NewFoldersModel newFoldersModel});
}

class AddFoldersRemoteDateSourceImpl extends RemoteExecuteImpl
    implements AddFoldersRemoteDateSource {
  AddFoldersRemoteDateSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> addFolder({
    required NewFoldersModel newFoldersModel,
  }) => addData(
    endPoint: EndPoints.folders,
    getFromJsonFunction: ResponseModel.fromJson,
    data: newFoldersModel.toJson(),isFormData: true
  );
}
