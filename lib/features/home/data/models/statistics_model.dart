import 'package:intl/intl.dart';
import '../../../../exports.dart';

class StatisticsResponseModel extends ResponseModel {
  StatisticsResponseModel({
    super.status,
    super.message,
    super.data,
  });

  StatisticsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? StatisticsDataModel.fromJson(json['data']) : null;
  }
}

class StatisticsDataModel {
  StatisticsDataModel({
    this.weekPercentageData,
    this.dailyData,
    this.booksPercentage,
    this.examsPercentage,
    this.getExcitementPoin,
    this.getExcitementPoinPercent,
  });

  StatisticsDataModel.fromJson(dynamic json) {
    weekPercentageData = json['weekPercentageData'] != null
        ? WeekPercentageData.fromJson(json['weekPercentageData'])
        : null;
    if (json['dailyData'] != null) {
      dailyData = [];
      json['dailyData'].forEach((v) {
        dailyData?.add(DailyData.fromJson(v));
      });
    }
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

  WeekPercentageData? weekPercentageData;
  List<DailyData>? dailyData;
  BooksPercentage? booksPercentage;
  ExamsPercentage? examsPercentage;
  String? getExcitementPoin;
  double? getExcitementPoinPercent;

  StatisticsDataModel copyWith({
    WeekPercentageData? weekPercentageData,
    List<DailyData>? dailyData,
    BooksPercentage? booksPercentage,
    ExamsPercentage? examsPercentage,
    String? getExcitementPoin,
    double? getExcitementPoinPercent,
  }) =>
      StatisticsDataModel(
        weekPercentageData: weekPercentageData ?? this.weekPercentageData,
        dailyData: dailyData ?? this.dailyData,
        booksPercentage: booksPercentage ?? this.booksPercentage,
        examsPercentage: examsPercentage ?? this.examsPercentage,
        getExcitementPoin: getExcitementPoin ?? this.getExcitementPoin,
        getExcitementPoinPercent: getExcitementPoinPercent ?? this.getExcitementPoinPercent,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (weekPercentageData != null) {
      map['weekPercentageData'] = weekPercentageData?.toJson();
    }
    if (dailyData != null) {
      map['dailyData'] = dailyData?.map((v) => v.toJson()).toList();
    }
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

    examsGoal = json['examsGoal']?.toDouble();
    examsCount = json['examsCount']?.toDouble() ?? 0;
    percentageText = formatNumber.format(json['percentage']).toString();
    percentage =
        double.parse(formatNumber.format((json['percentage'] * 0.01) ?? '0'));
    percentage = percentage! > 1.0 ? 1.0 : percentage;
  }

  double? examsGoal;
  double? examsCount;
  double? percentage;
  String? percentageText;

  ExamsPercentage copyWith({
    double? examsGoal,
    double? examsCount,
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

    booksGoal = json['booksGoal']?.toDouble();
    booksCount = json['booksCount']?.toDouble();
    percentageText = formatNumber.format(json['percentage']).toString();
    percentage =
        double.parse(formatNumber.format((json['percentage'] * 0.01) ?? '0'));
    percentage = percentage! > 1.0 ? 1.0 : percentage;
  }

  double? booksGoal;
  double? booksCount;
  double? percentage;
  String? percentageText;

  BooksPercentage copyWith({
    double? booksGoal,
    double? booksCount,
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

class DailyData {
  DailyData({
    this.index,
    this.todayPercentage,
  });

  DailyData.fromJson(dynamic json) {
    index = json['index'];
    todayPercentage = json['todayPercentage'] != null
        ? TodayPercentage.fromJson(json['todayPercentage'])
        : null;
  }

  int? index;
  TodayPercentage? todayPercentage;

  DailyData copyWith({
    int? index,
    TodayPercentage? todayPercentage,
  }) => DailyData(
    index: index ?? this.index,
    todayPercentage: todayPercentage ?? this.todayPercentage,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['index'] = index;
    if (todayPercentage != null) {
      map['todayPercentage'] = todayPercentage?.toJson();
    }
    return map;
  }
}

class TodayPercentage {
  TodayPercentage({
    this.booksGoal,
    this.booksCount,
    this.percentage,
    this.percentageText,
  });

  TodayPercentage.fromJson(dynamic json) {
    var formatNumber = NumberFormat("##.##", "en_US");

    booksGoal = json['booksGoal'];
    booksCount = json['booksCount']?.toDouble();
    percentageText = formatNumber.format(json['percentage']).toString();
    percentage =
        double.parse(formatNumber.format((json['percentage'] * 0.01) ?? '0'));
        percentage = percentage! > 1.0 ? 1.0 : percentage;
    }

  int? booksGoal;
  double? booksCount;
  double? percentage;
  String? percentageText;

  TodayPercentage copyWith({
    int? booksGoal,
    double? booksCount,
    double? percentage,
    String? percentageText,
  }) => TodayPercentage(
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

class WeekPercentageData {
  WeekPercentageData({
    this.booksGoal,
    this.booksCount,
    this.percentage,
    this.percentageText,
  });

  WeekPercentageData.fromJson(dynamic json) {
    var formatNumber = NumberFormat("##.##", "en_US");

    booksGoal = json['booksGoal']?.toDouble();
    booksCount = json['booksCount']?.toDouble();
    percentageText = formatNumber.format(json['percentage']).toString();
    percentage =
        double.parse(formatNumber.format((json['percentage'] * 0.01) ?? '0'));
        percentage = percentage! > 1.0 ? 1.0 : percentage;
    }

  double? booksGoal;
  double? booksCount;
  double? percentage;
  String? percentageText;

  WeekPercentageData copyWith({
    double? booksGoal,
    double? booksCount,
    double? percentage,
    String? percentageText,
  }) => WeekPercentageData(
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