
import 'package:new_ilearn/features/home/data/models/folders_model.dart';
import 'package:new_ilearn/features/home/data/models/groups_chat_model.dart';

import '../../../../exports.dart';

abstract class GroupsChatRemoteDateSource {
  Future<ResponseModel> getGroups();
}
class GroupsChatRemoteDateSourceImpl extends  RemoteExecuteImpl  implements GroupsChatRemoteDateSource {
  GroupsChatRemoteDateSourceImpl({required super.dioConsumer});

  @override
  Future<ResponseModel> getGroups() =>getData(endPoint: EndPoints.groupsChat , getFromJsonFunction: GroupsResponseChatModel.fromJson);
  
}