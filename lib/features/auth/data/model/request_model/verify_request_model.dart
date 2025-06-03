class VerifyRequestModel {
  String email;
  String verifyCode;
  //
  // String? deviceToken;

  VerifyRequestModel({required this.email, required this.verifyCode,});

  Map<String, dynamic> toJson() => {
    "email": email,
    "resetCode": verifyCode,
    // "Fcm_Token": deviceToken
  };
}
