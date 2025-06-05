class VerifyForgetPasswordRequestModel {
  String email;
  String verifyCode;
  //
  // String? deviceToken;

  VerifyForgetPasswordRequestModel({required this.email, required this.verifyCode,});

  Map<String, dynamic> toJson() => {
    "email": email,
    "resetCode": verifyCode,
    // "Fcm_Token": deviceToken
  };
}
