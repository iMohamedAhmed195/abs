import '../../../../exports.dart';

class GroupsResponseChatModel extends ResponseModel {
  GroupsResponseChatModel({
      super.status,
    super.message,
    super.data,});

  GroupsResponseChatModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? GroupsDataChatModel.fromJson(json['data']) : null;
  }


}

class GroupsDataChatModel {
  GroupsDataChatModel({
      this.page, 
      this.pageSize, 
      this.count, 
      this.items, 
      this.pages,});

  GroupsDataChatModel.fromJson(dynamic json) {
    page = json['page'];
    pageSize = json['pageSize'];
    count = json['count'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    pages = json['pages'];
  }
  num? page;
  num? pageSize;
  num? count;
  List<Items>? items;
  num? pages;
GroupsDataChatModel copyWith({  num? page,
  num? pageSize,
  num? count,
  List<Items>? items,
  num? pages,
}) => GroupsDataChatModel(  page: page ?? this.page,
  pageSize: pageSize ?? this.pageSize,
  count: count ?? this.count,
  items: items ?? this.items,
  pages: pages ?? this.pages,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['pageSize'] = pageSize;
    map['count'] = count;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['pages'] = pages;
    return map;
  }

}

class Items {
  Items({
      this.fullImageUrl, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.name, 
      this.imageUrl, 
      this.backgroundColor, 
      this.backgroundCoverUrl, 
      this.userGroupsChats, 
      this.acceptJoin, 
      this.messages, 
      this.unreadMessagesCount,});

  Items.fromJson(dynamic json) {
    fullImageUrl = json['fullImageUrl'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    backgroundColor = json['backgroundColor'];
    backgroundCoverUrl = json['backgroundCoverUrl'];
    if (json['userGroupsChats'] != null) {
      userGroupsChats = [];
      json['userGroupsChats'].forEach((v) {
        userGroupsChats?.add(UserGroupsChats.fromJson(v));
      });
    }
    acceptJoin = json['acceptJoin'];
    if (json['messages'] != null) {
      messages = [];
      json['messages'].forEach((v) {
        messages?.add(Messages.fromJson(v));
      });
    }
    unreadMessagesCount = json['unreadMessagesCount'];
  }
  String? fullImageUrl;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? imageUrl;
  dynamic backgroundColor;
  dynamic backgroundCoverUrl;
  List<UserGroupsChats>? userGroupsChats;
  bool? acceptJoin;
  List<Messages>? messages;
  num? unreadMessagesCount;
Items copyWith({  String? fullImageUrl,
  String? id,
  String? createdAt,
  String? updatedAt,
  String? name,
  String? imageUrl,
  dynamic backgroundColor,
  dynamic backgroundCoverUrl,
  List<UserGroupsChats>? userGroupsChats,
  bool? acceptJoin,
  List<Messages>? messages,
  num? unreadMessagesCount,
}) => Items(  fullImageUrl: fullImageUrl ?? this.fullImageUrl,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  name: name ?? this.name,
  imageUrl: imageUrl ?? this.imageUrl,
  backgroundColor: backgroundColor ?? this.backgroundColor,
  backgroundCoverUrl: backgroundCoverUrl ?? this.backgroundCoverUrl,
  userGroupsChats: userGroupsChats ?? this.userGroupsChats,
  acceptJoin: acceptJoin ?? this.acceptJoin,
  messages: messages ?? this.messages,
  unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullImageUrl'] = fullImageUrl;
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    map['imageUrl'] = imageUrl;
    map['backgroundColor'] = backgroundColor;
    map['backgroundCoverUrl'] = backgroundCoverUrl;
    if (userGroupsChats != null) {
      map['userGroupsChats'] = userGroupsChats?.map((v) => v.toJson()).toList();
    }
    map['acceptJoin'] = acceptJoin;
    if (messages != null) {
      map['messages'] = messages?.map((v) => v.toJson()).toList();
    }
    map['unreadMessagesCount'] = unreadMessagesCount;
    return map;
  }

}

class Messages {
  Messages({
      this.fullImageUrl, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.message, 
      this.imageUrl, 
      this.recordUrl, 
      this.isLink, 
      this.fileUrl, 
      this.readbyIds, 
      this.seen,});

  Messages.fromJson(dynamic json) {
    fullImageUrl = json['fullImageUrl'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    message = json['message'];
    imageUrl = json['imageUrl'];
    recordUrl = json['recordUrl'];
    isLink = json['isLink'];
    fileUrl = json['fileUrl'];
    readbyIds = json['readbyIds'] != null ? json['readbyIds'].cast<String>() : [];
    seen = json['seen'];
  }
  dynamic fullImageUrl;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? message;
  dynamic imageUrl;
  dynamic recordUrl;
  bool? isLink;
  dynamic fileUrl;
  List<String>? readbyIds;
  bool? seen;
Messages copyWith({  dynamic fullImageUrl,
  String? id,
  String? createdAt,
  String? updatedAt,
  String? message,
  dynamic imageUrl,
  dynamic recordUrl,
  bool? isLink,
  dynamic fileUrl,
  List<String>? readbyIds,
  bool? seen,
}) => Messages(  fullImageUrl: fullImageUrl ?? this.fullImageUrl,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  message: message ?? this.message,
  imageUrl: imageUrl ?? this.imageUrl,
  recordUrl: recordUrl ?? this.recordUrl,
  isLink: isLink ?? this.isLink,
  fileUrl: fileUrl ?? this.fileUrl,
  readbyIds: readbyIds ?? this.readbyIds,
  seen: seen ?? this.seen,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullImageUrl'] = fullImageUrl;
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['message'] = message;
    map['imageUrl'] = imageUrl;
    map['recordUrl'] = recordUrl;
    map['isLink'] = isLink;
    map['fileUrl'] = fileUrl;
    map['readbyIds'] = readbyIds;
    map['seen'] = seen;
    return map;
  }

}

class UserGroupsChats {
  UserGroupsChats({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.muteNotification, 
      this.acceptJoin, 
      this.role,});

  UserGroupsChats.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    muteNotification = json['muteNotification'];
    acceptJoin = json['acceptJoin'];
    role = json['role'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  bool? muteNotification;
  bool? acceptJoin;
  String? role;
UserGroupsChats copyWith({  String? id,
  String? createdAt,
  String? updatedAt,
  bool? muteNotification,
  bool? acceptJoin,
  String? role,
}) => UserGroupsChats(  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  muteNotification: muteNotification ?? this.muteNotification,
  acceptJoin: acceptJoin ?? this.acceptJoin,
  role: role ?? this.role,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['muteNotification'] = muteNotification;
    map['acceptJoin'] = acceptJoin;
    map['role'] = role;
    return map;
  }

}