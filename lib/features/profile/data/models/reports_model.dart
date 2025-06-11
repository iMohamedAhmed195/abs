import 'package:new_ilearn/config/network/model/response_model.dart';

class ReportsResponseModel extends ResponseModel {
  ReportsResponseModel({
      super.status, 
      super.message, 
      super.data,});

  ReportsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ReportsDataModel.fromJson(json['data']) : null;
  }
 

}

class ReportsDataModel {
  ReportsDataModel({
      this.booksPercentage, 
      this.examsPercentage, 
      this.getExcitementPoin,});

  ReportsDataModel.fromJson(dynamic json) {
    booksPercentage = json['booksPercentage'] != null ? BooksPercentage.fromJson(json['booksPercentage']) : null;
    examsPercentage = json['examsPercentage'] != null ? ExamsPercentage.fromJson(json['examsPercentage']) : null;
    getExcitementPoin = json['getExcitementPoin'];
  }
  BooksPercentage? booksPercentage;
  ExamsPercentage? examsPercentage;
  num? getExcitementPoin;
ReportsDataModel copyWith({  BooksPercentage? booksPercentage,
  ExamsPercentage? examsPercentage,
  num? getExcitementPoin,
}) => ReportsDataModel(  booksPercentage: booksPercentage ?? this.booksPercentage,
  examsPercentage: examsPercentage ?? this.examsPercentage,
  getExcitementPoin: getExcitementPoin ?? this.getExcitementPoin,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (booksPercentage != null) {
      map['booksPercentage'] = booksPercentage?.toJson();
    }
    if (examsPercentage != null) {
      map['examsPercentage'] = examsPercentage?.toJson();
    }
    map['getExcitementPoin'] = getExcitementPoin;
    return map;
  }

}

class ExamsPercentage {
  ExamsPercentage({
      this.examsGoal, 
      this.examsCount, 
      this.percentage,});

  ExamsPercentage.fromJson(dynamic json) {
    examsGoal = json['examsGoal'];
    examsCount = json['examsCount'];
    percentage = json['percentage'];
  }
  num? examsGoal;
  int? examsCount;
  num? percentage;
ExamsPercentage copyWith({  num? examsGoal,
  int? examsCount,
  num? percentage,
}) => ExamsPercentage(  examsGoal: examsGoal ?? this.examsGoal,
  examsCount: examsCount ?? this.examsCount,
  percentage: percentage ?? this.percentage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['examsGoal'] = examsGoal;
    map['examsCount'] = examsCount;
    map['percentage'] = percentage;
    return map;
  }

}

class BooksPercentage {
  BooksPercentage({
      this.booksGoal, 
      this.booksCount, 
      this.percentage,});

  BooksPercentage.fromJson(dynamic json) {
    booksGoal = json['booksGoal'];
    booksCount = json['booksCount'];
    percentage = json['percentage'];
  }
  num? booksGoal;
  int? booksCount;
  num? percentage;
BooksPercentage copyWith({  num? booksGoal,
  int? booksCount,
  num? percentage,
}) => BooksPercentage(  booksGoal: booksGoal ?? this.booksGoal,
  booksCount: booksCount ?? this.booksCount,
  percentage: percentage ?? this.percentage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['booksGoal'] = booksGoal;
    map['booksCount'] = booksCount;
    map['percentage'] = percentage;
    return map;
  }

}