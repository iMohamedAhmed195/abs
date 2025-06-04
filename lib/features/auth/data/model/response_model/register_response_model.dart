
import '../../../../../exports.dart';

class RegisterResponseModel extends ResponseModel {
  RegisterResponseModel({
    super.status,
    super.message,
    super.data,
  });

  RegisterResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserDataModel.fromJson(json['data']) : null;
  }

  RegisterResponseModel copyWith({
    bool? status,
    String? message,
    UserDataModel? data,
  }) =>
      RegisterResponseModel(
        status: status ?? this.status,
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

class UserDataModel {
  UserDataModel({
    this.verificationCode,
    this.user,
  });

  UserDataModel.fromJson(dynamic json) {
    verificationCode = json['verification_code'];
    user = json['user'] != null ? RegisterUserModel.fromJson(json['user']) : null;
  }
  num? verificationCode;
  RegisterUserModel? user;
  UserDataModel copyWith({
    num? verificationCode,
    RegisterUserModel? user,
  }) =>
      UserDataModel(
        verificationCode: verificationCode ?? this.verificationCode,
        user: user ?? this.user,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['verification_code'] = verificationCode;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class RegisterUserModel {
  RegisterUserModel({
    this.id,
    this.fname,
    this.lname,
    this.email,
    this.isBroker = false,
    this.gender,
    this.phone,
    this.verificationCode,
    this.nafazVerification,
    this.valLicense,
    this.lat,
    this.lng,
    this.role,
    this.valLicenseImage,
    this.createdAt,
    this.updatedAt,
  });

  RegisterUserModel.fromJson(dynamic json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    verificationCode = json['verification_code'];
    nafazVerification = json['nafaz_verification'];
    valLicense = json['val_license'];
    lat = json['lat'];
    lng = json['lng'];
    role = json['role'];
    if (json['val_license_image'] != null) {
      valLicenseImage = [];
      json['val_license_image'].forEach((v) {
        valLicenseImage?.add(json['val_license_image'].fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  bool? isBroker;
  String? fname;
  String? lname;
  String? email;
  String? gender;
  String? phone;
  num? verificationCode;
  int? nafazVerification;
  int? valLicense;
  String? lat;
  String? lng;
  String? role;
  List<String>? valLicenseImage;
  String? createdAt;
  String? updatedAt;
  RegisterUserModel copyWith({
    int? id,
    String? fname,
    String? lname,
    String? email,
    String? gender,
    String? phone,
    num? verificationCode,
    int? nafazVerification,
    int? valLicense,
    String? lat,
    String? lng,
    String? role,
    List<String>? valLicenseImage,
    String? createdAt,
    String? updatedAt,
  }) =>
      RegisterUserModel(
        id: id ?? this.id,
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        phone: phone ?? this.phone,
        verificationCode: verificationCode ?? this.verificationCode,
        nafazVerification: nafazVerification ?? this.nafazVerification,
        valLicense: valLicense ?? this.valLicense,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        role: role ?? this.role,
        valLicenseImage: valLicenseImage ?? this.valLicenseImage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fname'] = fname;
    map['lname'] = lname;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['verification_code'] = verificationCode;
    map['nafaz_verification'] = nafazVerification;
    map['valLicensee'] = valLicense;
    map['lat'] = lat;
    map['lng'] = lng;
    map['role'] = role;

    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
