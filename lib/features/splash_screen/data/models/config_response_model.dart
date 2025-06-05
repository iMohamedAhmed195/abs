import 'package:new_ilearn/config/network/model/response_model.dart';

class ConfigResponseModel extends ResponseModel{
  ConfigResponseModel({
      super.status,
      super.message,
      super.data,});

  ConfigResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ConfigData.fromJson(json['data']) : null;
  }
ConfigResponseModel copyWith({  bool? status,
  String? message,
  ConfigData? data,
}) => ConfigResponseModel(  status: status ?? this.status,
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

class ConfigData {
  ConfigData({
      this.country, 
      this.gender, 
      this.studyStage,});

  ConfigData.fromJson(dynamic json) {
    if (json['country'] != null) {
      country = [];
      json['country'].forEach((v) {
        country?.add(Country.fromJson(v));
      });
    }
    gender = json['gender'] != null ? Gender.fromJson(json['gender']) : null;
    studyStage = json['studyStage'] != null ? StudyStage.fromJson(json['studyStage']) : null;
  }
  List<Country>? country;
  Gender? gender;
  StudyStage? studyStage;
ConfigData copyWith({  List<Country>? country,
  Gender? gender,
  StudyStage? studyStage,
}) => ConfigData(  country: country ?? this.country,
  gender: gender ?? this.gender,
  studyStage: studyStage ?? this.studyStage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (country != null) {
      map['country'] = country?.map((v) => v.toJson()).toList();
    }
    if (gender != null) {
      map['gender'] = gender?.toJson();
    }
    if (studyStage != null) {
      map['studyStage'] = studyStage?.toJson();
    }
    return map;
  }

}

class StudyStage {
  StudyStage({
      this.collage, 
      this.school,});

  StudyStage.fromJson(dynamic json) {
    collage = json['COLLAGE'];
    school = json['SCHOOL'];
  }
  String? collage;
  String? school;
StudyStage copyWith({  String? collage,
  String? school,
}) => StudyStage(  collage: collage ?? this.collage,
  school: school ?? this.school,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['COLLAGE'] = collage;
    map['SCHOOL'] = school;
    return map;
  }

}

class Gender {
  Gender({
      this.male, 
      this.female,});

  Gender.fromJson(dynamic json) {
    male = json['MALE'];
    female = json['FEMALE'];
  }
  String? male;
  String? female;
Gender copyWith({  String? male,
  String? female,
}) => Gender(  male: male ?? this.male,
  female: female ?? this.female,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MALE'] = male;
    map['FEMALE'] = female;
    return map;
  }

}

class Country {
  Country({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.name, 
      this.imageUrl,});

  Country.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? imageUrl;
Country copyWith({  String? id,
  String? createdAt,
  String? updatedAt,
  String? name,
  String? imageUrl,
}) => Country(  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  name: name ?? this.name,
  imageUrl: imageUrl ?? this.imageUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    map['imageUrl'] = imageUrl;
    return map;
  }

}