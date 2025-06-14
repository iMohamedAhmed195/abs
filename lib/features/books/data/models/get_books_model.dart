import 'package:new_ilearn/config/network/model/response_model.dart';

class GetBooksResponseModel extends ResponseModel{
  GetBooksResponseModel({
      super.status,
      super.message,
      super.data,});

  GetBooksResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? BooksDataModel.fromJson(json['data']) : null;
  }
GetBooksResponseModel copyWith({  bool? status,
  String? message,
  BooksDataModel? data,
}) => GetBooksResponseModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class BooksDataModel {
  BooksDataModel({
      this.page, 
      this.pageSize, 
      this.count, 
      this.items, 
      this.pages,});

  BooksDataModel.fromJson(dynamic json) {
    page = json['page'];
    pageSize = json['pageSize'];
    count = json['count'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Books.fromJson(v));
      });
    }
    pages = json['pages'];
  }
  num? page;
  num? pageSize;
  num? count;
  List<Books>? items;
  num? pages;
BooksDataModel copyWith({  num? page,
  num? pageSize,
  num? count,
  List<Books>? items,
  num? pages,
}) => BooksDataModel(  page: page ?? this.page,
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

class Books {
  Books({
      this.fullImageUrl, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.name, 
      this.imageUrl, 
      this.s3Key, 
      this.localPath, 
      this.fileUrl, 
      this.link, 
      this.content, 
      this.chatbots, 
      this.quizes, 
      this.category,
    this.checkedBook,
  });

  Books.fromJson(dynamic json) {
    fullImageUrl = json['fullImageUrl'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    s3Key = json['s3Key'];
    localPath = json['localPath'];
    fileUrl = json['fileUrl'];
    link = json['link'];
    content = json['content'];
    // if (json['chatbots'] != null) {
    //   chatbots = [];
    //   json['chatbots'].forEach((v) {
    //     chatbots?.add(Dynamic.fromJson(v));
    //   });
    // }
    // if (json['quizes'] != null) {
    //   quizes = [];
    //   json['quizes'].forEach((v) {
    //     quizes?.add(Dynamic.fromJson(v));
    //   });
    // }
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  String? fullImageUrl;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? imageUrl;
  String? s3Key;
  String? localPath;
  String? fileUrl;
  String? link;
  String? content;
  List<dynamic>? chatbots;
  List<dynamic>? quizes;
  Category? category;
  bool? checkedBook = false;
Books copyWith({  String? fullImageUrl,
  String? id,
  String? createdAt,
  String? updatedAt,
  String? name,
  dynamic imageUrl,
  dynamic s3Key,
  dynamic localPath,
  dynamic fileUrl,
  String? link,
  String? content,
  List<dynamic>? chatbots,
  List<dynamic>? quizes,
  Category? category,
}) => Books(  fullImageUrl: fullImageUrl ?? this.fullImageUrl,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  name: name ?? this.name,
  imageUrl: imageUrl ?? this.imageUrl,
  s3Key: s3Key ?? this.s3Key,
  localPath: localPath ?? this.localPath,
  fileUrl: fileUrl ?? this.fileUrl,
  link: link ?? this.link,
  content: content ?? this.content,
  chatbots: chatbots ?? this.chatbots,
  quizes: quizes ?? this.quizes,
  category: category ?? this.category,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullImageUrl'] = fullImageUrl;
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    map['imageUrl'] = imageUrl;
    map['s3Key'] = s3Key;
    map['localPath'] = localPath;
    map['fileUrl'] = fileUrl;
    map['link'] = link;
    map['content'] = content;
    if (chatbots != null) {
      map['chatbots'] = chatbots?.map((v) => v.toJson()).toList();
    }
    if (quizes != null) {
      map['quizes'] = quizes?.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}

class Category {
  Category({
      this.fullImageUrl, 
      this.id,});

  Category.fromJson(dynamic json) {
    fullImageUrl = json['fullImageUrl'];
    id = json['id'];
  }
  String? fullImageUrl;
  String? id;
Category copyWith({  String? fullImageUrl,
  String? id,
}) => Category(  fullImageUrl: fullImageUrl ?? this.fullImageUrl,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullImageUrl'] = fullImageUrl;
    map['id'] = id;
    return map;
  }

}