class VerifyEmailRequestModel {
  String email;
  String verifyCode;
  //
  // String? deviceToken;

  VerifyEmailRequestModel({required this.email, required this.verifyCode,});

  Map<String, dynamic> toJson() => {
    "email": email,
    "verifyCode": verifyCode,
    // "Fcm_Token": deviceToken
  };
}
