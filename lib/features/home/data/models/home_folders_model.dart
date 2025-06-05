import '../../../../exports.dart';

class HomeFoldersResponseModel extends ResponseModel {
  HomeFoldersResponseModel({
      super.status, 
      super.message, 
      super.data,});

  HomeFoldersResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeFoldersDataModel.fromJson(json['data']) : null;
  }
   
}

class HomeFoldersDataModel {
  HomeFoldersDataModel({
      this.categories, 
      this.books,});

  HomeFoldersDataModel.fromJson(dynamic json) {
    categories = json['categories'] != null ? Categories.fromJson(json['categories']) : null;
    books = json['books'] != null ? Books.fromJson(json['books']) : null;
  }
  Categories? categories;
  Books? books;
HomeFoldersDataModel copyWith({  Categories? categories,
  Books? books,
}) => HomeFoldersDataModel(  categories: categories ?? this.categories,
  books: books ?? this.books,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.toJson();
    }
    if (books != null) {
      map['books'] = books?.toJson();
    }
    return map;
  }

}

class Books {
  Books({
      this.page, 
      this.pageSize, 
      this.count, 
      this.items, 
      this.pages,});

  Books.fromJson(dynamic json) {
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
Books copyWith({  num? page,
  num? pageSize,
  num? count,
  List<Items>? items,
  num? pages,
}) => Books(  page: page ?? this.page,
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
      this.s3Key, 
      this.localPath, 
      this.fileUrl, 
      this.link, 
      this.content,});

  Items.fromJson(dynamic json) {
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
  }
  String? fullImageUrl;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  dynamic imageUrl;
  dynamic s3Key;
  String? localPath;
  String? fileUrl;
  String? link;
  String? content;
Items copyWith({  String? fullImageUrl,
  String? id,
  String? createdAt,
  String? updatedAt,
  String? name,
  dynamic imageUrl,
  dynamic s3Key,
  String? localPath,
  String? fileUrl,
  String? link,
  String? content,
}) => Items(  fullImageUrl: fullImageUrl ?? this.fullImageUrl,
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
    return map;
  }

}

class Categories {
  Categories({
      this.page, 
      this.pageSize, 
      this.count, 
      this.items, 
      this.pages,});

  Categories.fromJson(dynamic json) {
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
Categories copyWith({  num? page,
  num? pageSize,
  num? count,
  List<Items>? items,
  num? pages,
}) => Categories(  page: page ?? this.page,
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
 