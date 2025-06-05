class RegisterRequestModel {
  String? username;
  String? email;
  String? image;
  String? password;
  String? countryCode;
  String? gender;
  String? learningStage;

  RegisterRequestModel({
    this.image,
    this.password,
    this.email,
    this.username,
    this.countryCode,
    this.gender,
    this.learningStage,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_code'] = countryCode;
    map['image'] = image;
    map['password'] = password;
    map['email'] = email;
    map['username'] = username;
    map['gender'] = gender;
    map['learningStage'] = learningStage;
    return map;
  }
}
