import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/core/models/messages_chat_bot_data.dart';
import 'package:new_ilearn/core/models/user_model.dart';
import 'package:new_ilearn/exports.dart';

class GroupDetails {
  late String name;
  late String imageUrl;
  late String? backgroundColor;
  late String? backgroundCoverUrl;
  late String id;
  late String createdAt;
  late String updatedAt;
  late dynamic unreadMessagesCount;
  late List<MessagesChatBot> messages = [];
  late List<UserGroupsChats>? userGroupsChats;
  late bool? acceptJoin;
  bool selected = false;

  GroupDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    acceptJoin = json['acceptJoin'];
    unreadMessagesCount = json['unreadMessagesCount'];
    imageUrl = '${EndPoints.image}${json['imageUrl']}';
    backgroundColor = json['backgroundColor'];
    backgroundCoverUrl = json['backgroundCoverUrl'];
    if (json['messages'] != null) {
      messages = <MessagesChatBot>[];
      json['messages'].forEach((v) {
        messages.add(MessagesChatBot.fromJson(v));
      });
    }
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['userGroupsChats'] != null) {
      userGroupsChats = <UserGroupsChats>[];
      json['userGroupsChats'].forEach((v) {
        userGroupsChats!.add(UserGroupsChats.fromJson(v));
      });
    }
  }
}

class UpdateUserRoleModel {
  UserGroupsChats? data;

  UpdateUserRoleModel({this.data});

  UpdateUserRoleModel.fromJson(Map<String, dynamic> json) {
    data = UserGroupsChats.fromJson(json['data']);
  }
}

class UserGroupsChats {
  late String id;
  late String? inviteCode;
  late String? createdAt;
  late String? updatedAt;
  late bool? muteNotification;
  late String role;
  late User? user;
  bool permissionToUpdate = false;

  UserGroupsChats(this.id, this.role, this.user, {this.inviteCode});

  UserGroupsChats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inviteCode = json['inviteCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    muteNotification = json['muteNotification'];
    role = json['role'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (user != null) {
      permissionToUpdate = (AppPrefs.userId == user!.id)
          ? role == 'admin'
          ? true
          : false
          : false;
    }
  }
}
