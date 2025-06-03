import 'package:new_ilearn/config/network/model/response_model.dart';

class AuthResponseModel extends ResponseModel {
  AuthResponseModel({
      super.status,
      super.message,
      super.data,});

  AuthResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

AuthResponseModel copyWith({  bool? status,
  String? message,
  UserData? data,
}) => AuthResponseModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
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

class UserData {
  UserData({
      this.user, 
      this.token, 
      this.refreshToken,});

  UserData.fromJson(dynamic json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
    refreshToken = json['refreshToken'];
  }
  UserModel? user;
  String? token;
  String? refreshToken;
UserData copyWith({  UserModel? user,
  String? token,
  String? refreshToken,
}) => UserData(  user: user ?? this.user,
  token: token ?? this.token,
  refreshToken: refreshToken ?? this.refreshToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    map['refreshToken'] = refreshToken;
    return map;
  }

}

class UserModel {
  UserModel({
      this.fullImageUrl, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.email, 
      this.phoneNumber, 
      this.username, 
      this.dashboardPassword, 
      this.googleId, 
      this.facebookId, 
      this.twitterId, 
      this.appleId, 
      this.birthDate, 
      this.gender, 
      this.imageUrl, 
      this.verifyEmail, 
      this.verifyCode, 
      this.passwordChangedAt, 
      this.passwordResetCode, 
      this.passwordResetExpires, 
      this.passwordResetVerified, 
      this.booksGoal, 
      this.examsGoal, 
      this.intensePoints, 
      this.fcm, 
      this.language, 
      this.role, 
      this.status, 
      this.inviteCode,});

  UserModel.fromJson(dynamic json) {
    fullImageUrl = json['fullImageUrl'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    username = json['username'];
    dashboardPassword = json['dashboardPassword'];
    googleId = json['googleId'];
    facebookId = json['facebookId'];
    twitterId = json['twitterId'];
    appleId = json['appleId'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    imageUrl = json['imageUrl'];
    verifyEmail = json['verifyEmail'];
    verifyCode = json['verifyCode'];
    passwordChangedAt = json['passwordChangedAt'];
    passwordResetCode = json['passwordResetCode'];
    passwordResetExpires = json['passwordResetExpires'];
    passwordResetVerified = json['passwordResetVerified'];
    booksGoal = json['booksGoal'];
    examsGoal = json['examsGoal'];
    intensePoints = json['intensePoints'];
    fcm = json['fcm'];
    language = json['language'];
    role = json['role'];
    status = json['status'];
    inviteCode = json['inviteCode'];
  }
  String? fullImageUrl;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? phoneNumber;
  String? username;
  String? dashboardPassword;
  String? googleId;
  String? facebookId;
  String? twitterId;
  String? appleId;
  String? birthDate;
  String? gender;
  String? imageUrl;
  bool? verifyEmail;
  num? verifyCode;
  String? passwordChangedAt;
  num? passwordResetCode;
  String? passwordResetExpires;
  bool? passwordResetVerified;
  num? booksGoal;
  num? examsGoal;
  num? intensePoints;
  String? fcm;
  String? language;
  String? role;
  String? status;
  num? inviteCode;
UserModel copyWith({  String? fullImageUrl,
  String? id,
  String? createdAt,
  String? updatedAt,
  String? email,
  String? phoneNumber,
  String? username,
  String? dashboardPassword,
  String? googleId,
  String? facebookId,
  String? twitterId,
  String? appleId,
  String? birthDate,
  String? gender,
  String? imageUrl,
  bool? verifyEmail,
  num? verifyCode,
  String? passwordChangedAt,
  num? passwordResetCode,
  String? passwordResetExpires,
  bool? passwordResetVerified,
  num? booksGoal,
  num? examsGoal,
  num? intensePoints,
  String? fcm,
  String? language,
  String? role,
  String? status,
  num? inviteCode,
}) => UserModel(  fullImageUrl: fullImageUrl ?? this.fullImageUrl,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  email: email ?? this.email,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  username: username ?? this.username,
  dashboardPassword: dashboardPassword ?? this.dashboardPassword,
  googleId: googleId ?? this.googleId,
  facebookId: facebookId ?? this.facebookId,
  twitterId: twitterId ?? this.twitterId,
  appleId: appleId ?? this.appleId,
  birthDate: birthDate ?? this.birthDate,
  gender: gender ?? this.gender,
  imageUrl: imageUrl ?? this.imageUrl,
  verifyEmail: verifyEmail ?? this.verifyEmail,
  verifyCode: verifyCode ?? this.verifyCode,
  passwordChangedAt: passwordChangedAt ?? this.passwordChangedAt,
  passwordResetCode: passwordResetCode ?? this.passwordResetCode,
  passwordResetExpires: passwordResetExpires ?? this.passwordResetExpires,
  passwordResetVerified: passwordResetVerified ?? this.passwordResetVerified,
  booksGoal: booksGoal ?? this.booksGoal,
  examsGoal: examsGoal ?? this.examsGoal,
  intensePoints: intensePoints ?? this.intensePoints,
  fcm: fcm ?? this.fcm,
  language: language ?? this.language,
  role: role ?? this.role,
  status: status ?? this.status,
  inviteCode: inviteCode ?? this.inviteCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullImageUrl'] = fullImageUrl;
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['username'] = username;
    map['dashboardPassword'] = dashboardPassword;
    map['googleId'] = googleId;
    map['facebookId'] = facebookId;
    map['twitterId'] = twitterId;
    map['appleId'] = appleId;
    map['birthDate'] = birthDate;
    map['gender'] = gender;
    map['imageUrl'] = imageUrl;
    map['verifyEmail'] = verifyEmail;
    map['verifyCode'] = verifyCode;
    map['passwordChangedAt'] = passwordChangedAt;
    map['passwordResetCode'] = passwordResetCode;
    map['passwordResetExpires'] = passwordResetExpires;
    map['passwordResetVerified'] = passwordResetVerified;
    map['booksGoal'] = booksGoal;
    map['examsGoal'] = examsGoal;
    map['intensePoints'] = intensePoints;
    map['fcm'] = fcm;
    map['language'] = language;
    map['role'] = role;
    map['status'] = status;
    map['inviteCode'] = inviteCode;
    return map;
  }

}