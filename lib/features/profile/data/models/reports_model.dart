
import '../../../../exports.dart';

class ReportsResponseModel extends ResponseModel {
  ReportsResponseModel({
    super.status,
    super.message,
    super.data,
  });

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
    this.getExcitementPoin,
    this.getExcitementPoinPercent,
  });

  ReportsDataModel.fromJson(dynamic json) {
    booksPercentage = json['booksPercentage'] != null
        ? BooksPercentage.fromJson(json['booksPercentage'])
        : null;
    examsPercentage = json['examsPercentage'] != null
        ? ExamsPercentage.fromJson(json['examsPercentage'])
        : null;
    getExcitementPoin = json['getExcitementPoin'].toString();
    getExcitementPoinPercent =
        (double.parse(getExcitementPoin ?? '0') / 100).toDouble();
    getExcitementPoinPercent =
        (getExcitementPoinPercent! > 1.0 ? 1.0 : getExcitementPoinPercent)?.toDouble();
  }

  BooksPercentage? booksPercentage;
  ExamsPercentage? examsPercentage;
  String? getExcitementPoin;
  double? getExcitementPoinPercent;

  ReportsDataModel copyWith({
    BooksPercentage? booksPercentage,
    ExamsPercentage? examsPercentage,
    String? getExcitementPoin,
    double? getExcitementPoinPercent,
  }) => ReportsDataModel(
    booksPercentage: booksPercentage ?? this.booksPercentage,
    examsPercentage: examsPercentage ?? this.examsPercentage,
    getExcitementPoin: getExcitementPoin ?? this.getExcitementPoin,
    getExcitementPoinPercent: getExcitementPoinPercent ?? this.getExcitementPoinPercent,
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
    this.percentage,
    this.percentageText,
  });

  ExamsPercentage.fromJson(dynamic json) {
    var formatNumber = NumberFormat("##.##", "en_US");

    examsGoal = json['examsGoal'];
    examsCount = json['examsCount'] ?? 0;
    percentageText = formatNumber.format(json['percentage']).toString();
    percentage =
        double.parse(formatNumber.format((json['percentage'] * 0.01) ?? '0'));
        percentage = percentage! > 1.0 ? 1.0 : percentage;
    }

  int? examsGoal;
  int? examsCount;
  double? percentage;
  String? percentageText;

  ExamsPercentage copyWith({
    int? examsGoal,
    int? examsCount,
    double? percentage,
    String? percentageText,
  }) => ExamsPercentage(
    examsGoal: examsGoal ?? this.examsGoal,
    examsCount: examsCount ?? this.examsCount,
    percentage: percentage ?? this.percentage,
    percentageText: percentageText ?? this.percentageText,
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
    this.percentage,
    this.percentageText,
  });

  BooksPercentage.fromJson(dynamic json) {
    var formatNumber = NumberFormat("##.##", "en_US");

    booksGoal = json['booksGoal'];
    booksCount = json['booksCount'];
    percentageText = formatNumber.format(json['percentage']).toString();
    percentage =
        double.parse(formatNumber.format((json['percentage'] * 0.01) ?? '0'));
    percentage = percentage! > 1.0 ? 1.0 : percentage;
  }

  int? booksGoal;
  int? booksCount;
  double? percentage;
  String? percentageText;

  BooksPercentage copyWith({
    int? booksGoal,
    int? booksCount,
    double? percentage,
    String? percentageText,
  }) => BooksPercentage(
    booksGoal: booksGoal ?? this.booksGoal,
    booksCount: booksCount ?? this.booksCount,
    percentage: percentage ?? this.percentage,
    percentageText: percentageText ?? this.percentageText,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['booksGoal'] = booksGoal;
    map['booksCount'] = booksCount;
    map['percentage'] = percentage;
    return map;
  }
}