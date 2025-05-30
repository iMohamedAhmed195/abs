import 'package:new_ilearn/config/constants/app_constants.dart';
import 'package:new_ilearn/core/utils/app_strings.dart';
import 'package:new_ilearn/exports.dart';

class UserData {
  late User? user;
  late String? token;

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null
        ? User.fromJson(json['user'])
        : json['data'] != null
        ? User.fromJson(json['data'])
        : null;
    token = json['token'];
  }
}

class User {
  late String id;
  late String? createdAt;
  late String? updatedAt;
  late String email;
  late String? phoneNumber;
  late String username;
  late String? birthDate;
  late String? gender;
  late String? imageUrl;
  late String? passwordChangedAt;
  late int? passwordResetCode;
  late String? passwordResetExpires;
  late bool? passwordResetVerified;
  late String examsGoal;
  late String bookGoal;
  late String? inviteCode;

  User(this.id, this.email, this.phoneNumber, this.username, this.birthDate,
      this.gender, this.imageUrl, this.inviteCode);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    email = json['email'] ?? '';
    examsGoal = json['examsGoal'].toString();
    bookGoal = json['booksGoal'].toString();
    phoneNumber = json['phoneNumber'];
    username = json['username'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    imageUrl = json['imageUrl'];
    imageUrl = imageUrl != null && imageUrl!.startsWith('/public')
        ? EndPoints.image + (imageUrl ?? '')
        : json['imageUrl'];
    passwordChangedAt = json['passwordChangedAt'];
    passwordResetCode = json['passwordResetCode'];
    passwordResetExpires = json['passwordResetExpires'];
    passwordResetVerified = json['passwordResetVerified'];
    inviteCode = json['inviteCode'].toString();
  }
}