import 'package:new_ilearn/features/auth/data/model/response_model/auth_response_model.dart';

import '../../../../exports.dart';
class ProfileResponseModel extends ResponseModel {

  ProfileResponseModel({
    required super.status,
    required super.message,
    required super.data,
  });
  ProfileResponseModel.fromJson(dynamic json){
    ProfileResponseModel(
      status: json['status'],
      message: json['message'],
      data: UserModel.fromJson(json['data']["user"]),
    );
  }
}



class ProfileModel {
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? birthDate;
  File? image;


  ProfileModel({
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.birthDate,
    this.image

  });
  toJson() => {
    'username': name,
    'email': email,
    'phoneNumber': phone,
    'gender': gender,
    'birthDate': birthDate,
    'image': image,
  };
}