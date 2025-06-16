class AddBooksRequestModel  {
  String? name;
  String? image;
  String? categoryId;
  String? content;
  String? link;
  String? file;
  AddBooksRequestModel({
    this.name,
    this.image,
    this.categoryId,
    this.content,
    this.link,
    this.file,
  });
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['categoryId'] = categoryId;
    map['image'] = image;
    map['link'] = link;
    map['content'] = content;
    map['file'] = file;
    return map;
  }

}