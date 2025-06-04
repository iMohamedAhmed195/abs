class EnterEmailRequestModel {
  String email;

  EnterEmailRequestModel({
    required this.email,
  });
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }
}