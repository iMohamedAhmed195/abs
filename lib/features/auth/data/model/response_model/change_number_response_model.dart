
import '../../../../../exports.dart';

class ChangeNumberResponseModel extends ResponseModel{
  ChangeNumberResponseModel({
      super.status,
      super.message,
      super.data,});

  ChangeNumberResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ChangeNumberUserDataModel.fromJson(json['data']) : null;
  }

ChangeNumberResponseModel copyWith({  bool? status,
  String? message,
  ChangeNumberUserDataModel? data,
}) => ChangeNumberResponseModel(  status: status ?? this.status,
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

class ChangeNumberUserDataModel {
  ChangeNumberUserDataModel({
      this.verificationCode, 
      this.user,});

  ChangeNumberUserDataModel.fromJson(dynamic json) {
    verificationCode = json['verification_code'];
    user = json['user'] != null ? ChangeNumberUserModel.fromJson(json['user']) : null;
  }
  int? verificationCode;
  ChangeNumberUserModel? user;
ChangeNumberUserDataModel copyWith({  int? verificationCode,
  ChangeNumberUserModel? user,
}) => ChangeNumberUserDataModel(  verificationCode: verificationCode ?? this.verificationCode,
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

class ChangeNumberUserModel {
  ChangeNumberUserModel({
      this.id, 
      this.fname, 
      this.lname, 
      this.email, 
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
      this.updatedAt,});

  ChangeNumberUserModel.fromJson(dynamic json) {
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
    valLicenseImage = json['val_license_image'] != null ? json['val_license_image'].cast<String>() : [];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? fname;
  String? lname;
  String? email;
  String? gender;
  String? phone;
  int? verificationCode;
  int? nafazVerification;
  int? valLicense;
  String? lat;
  String? lng;
  String? role;
  List<String>? valLicenseImage;
  String? createdAt;
  String? updatedAt;
ChangeNumberUserModel copyWith({  int? id,
  String? fname,
  String? lname,
  String? email,
  String? gender,
  String? phone,
  int? verificationCode,
  int? nafazVerification,
  int? valLicense,
  String? lat,
  String? lng,
  String? role,
  List<String>? valLicenseImage,
  String? createdAt,
  String? updatedAt,
}) => ChangeNumberUserModel(  id: id ?? this.id,
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
    map['val_license'] = valLicense;
    map['lat'] = lat;
    map['lng'] = lng;
    map['role'] = role;
    map['val_license_image'] = valLicenseImage;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}