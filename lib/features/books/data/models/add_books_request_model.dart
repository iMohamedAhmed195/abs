class AddBooksRequestModel  {
  String? name;
  String? image;
  String? categoryId;
  String? content;
  String? file;
  AddBooksRequestModel({
    this.name,
    this.image,
    this.categoryId,
    this.content,
    this.file,
  });
  AddBooksRequestModel.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    categoryId = json['categoryId'];
    content = json['content'];
    file = json['file'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}