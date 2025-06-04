class LoginRequestModel {
  String email;
  String password;
  String? deviceToken;
  LoginRequestModel({required this.email, required this.password, this.deviceToken});

  Map<String, dynamic> toJson() => {"email": email, "password": password, "fcm": ''};
}
