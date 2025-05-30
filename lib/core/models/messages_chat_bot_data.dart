import 'dart:developer';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/config/network/constants/endpoinst.dart';
import 'package:new_ilearn/core/models/groupe_details_model.dart';

class MessagesChatBotData {
  late int page;
  late int pageSize;
  late int count;
  late List<MessagesChatBot> items;
  late int pages;

  MessagesChatBotData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    count = json['count'];
    items = [];

    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(MessagesChatBot.fromJson(v));
      });
    }

    pages = json['pages'];
  }
}

class MessagesChatBot {
  String? id;
  String createdAt = '';
  String updatedAt = '';
  String message = '';
  String? userImage;

  // ملفات
  String? audioPath;
  String? imagePath;
  List<String> imagePaths = [];
  String? file;
  String? bookPath;
  String? bookName;

  // تحكمات
  String senderType = 'user';
  bool? isBookmarked;
  bool isUpload = false;
  bool errorSend = false;
  bool getFromInternet = true;

  GroupDetails? sharedGroup;

  String? chatId;
  final GlobalKey globalKey = GlobalKey();

   late bool playAudio = false;

  MessagesChatBot({
    required this.message,
    this.audioPath,
    this.imagePath,
    required this.senderType,
    this.bookName,
    this.bookPath,
    this.chatId,
    this.isUpload = false,
    this.errorSend = false,
    required this.createdAt,
    this.getFromInternet = true,
    this.id,
  });

  MessagesChatBot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
    message = json['message'] ?? '';
    file = json['fileUrl'];
    audioPath = json['recordUrl'];
    imagePath = json['imageUrl'];
    senderType = _parseSenderType(json['from'] ?? '') ?? 'user';
    isBookmarked = json['isBookmarked'];
    userImage = _parseImageUser(json['from']) ?? '';

    // دعم الصور المتعددة
    if (json['imageUrls'] != null && json['imageUrls'] is List) {
      imagePaths = List<String>.from(json['imageUrls']);
    } else if (imagePath != null) {
      imagePaths = [imagePath!];
    }

    // دعم جروب مشترك
    sharedGroup = json['sharedGroup'] != null
        ? GroupDetails.fromJson(json['sharedGroup'])
        : null;
  }

  MessagesChatBot.customFromJson(Map<String, dynamic> json) {
    id = json['message']['id'];
    createdAt = json['message']['createdAt'];
    message = json['message']['message'] ?? '';
    senderType = _parseSenderType(json['message']['from'] ?? '') ?? 'user';
  }
}

// استخراج نوع المرسل من ال JSON
dynamic _parseSenderType(dynamic value) {
  if (value is String) {
    log(value);
    return value;
  } else if (value is Map<String, dynamic>) {
    return value['id'] == AppPrefs.userId ? 'user' : value['username'];
  }
  return null;
}

// استخراج صورة المستخدم
String? _parseImageUser(dynamic value) {
  if (value is String) {
    return value;
  } else if (value is Map<String, dynamic>) {
    return value['id'] == AppPrefs.userId
        ? AppPrefs.profileImage
        : EndPoints.image + (value['imageUrl'] ?? '');
  }
  return null;
}

class From {
  late String id;
  late String email;
  late String username;
  late String imageUrl;

  From(this.id);

  From.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    imageUrl = json['imageUrl'];

    // تأكد من ربط الصورة برابط كامل إذا كانت من السيرفر
    imageUrl = imageUrl.startsWith('/public')
        ? EndPoints.image + imageUrl
        : imageUrl;
  }
}
