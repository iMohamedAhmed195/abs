import 'package:image_picker/image_picker.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

class FoldersResponseModel extends ResponseModel {
  FoldersResponseModel({
      super.status,
      super.message,
      super.data,});

  FoldersResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? FoldersDataModel.fromJson(json['data']) : null;
  }

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

class FoldersDataModel {
  FoldersDataModel({
      this.page,
      this.pageSize,
      this.count,
      this.items,
      this.pages,});

  FoldersDataModel.fromJson(dynamic json) {
    page = json['page'];
    pageSize = json['pageSize'];
    count = json['count'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Folders.fromJson(v));
      });
    }
    pages = json['pages'];
  }
  num? page;
  num? pageSize;
  num? count;
  List<Folders>? items;
  num? pages;
FoldersDataModel copyWith({  num? page,
  num? pageSize,
  num? count,
  List<Folders>? items,
  num? pages,
}) => FoldersDataModel(  page: page ?? this.page,
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

class Folders {
  Folders({
      this.fullImageUrl,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.imageUrl,
      this.books,});

  Folders.fromJson(dynamic json) {
    fullImageUrl = json['fullImageUrl'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    if (json['books'] != null) {
      books = [];
      json['books'].forEach((v) {
        books?.add(Books.fromJson(v));
      });
    }
  }
  String? fullImageUrl;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? imageUrl;
  List<Books>? books;
Folders copyWith({  String? fullImageUrl,
  String? id,
  String? createdAt,
  String? updatedAt,
  String? name,
  String? imageUrl,
  List<Books>? books,
}) => Folders(  fullImageUrl: fullImageUrl ?? this.fullImageUrl,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  name: name ?? this.name,
  imageUrl: imageUrl ?? this.imageUrl,
  books: books ?? this.books,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullImageUrl'] = fullImageUrl;
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    map['imageUrl'] = imageUrl;
    if (books != null) {
      map['books'] = books?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class NewFoldersModel  {
  String? name;
  File? image;
  NewFoldersModel({
      this.name,
      this.image,});
  NewFoldersModel.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}