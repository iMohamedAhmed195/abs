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
    getExcitementPoin = json['getExcitementPoin']?.toDouble();
  }

  WeekPercentageData? weekPercentageData;
  List<DailyData>? dailyData;
  BooksPercentage? booksPercentage;
  ExamsPercentage? examsPercentage;
  double? getExcitementPoin;

  StatisticsDataModel copyWith({
    WeekPercentageData? weekPercentageData,
    List<DailyData>? dailyData,
    BooksPercentage? booksPercentage,
    ExamsPercentage? examsPercentage,
    double? getExcitementPoin,
  }) =>
      StatisticsDataModel(
        weekPercentageData: weekPercentageData ?? this.weekPercentageData,
        dailyData: dailyData ?? this.dailyData,
        booksPercentage: booksPercentage ?? this.booksPercentage,
        examsPercentage: examsPercentage ?? this.examsPercentage,
        getExcitementPoin: getExcitementPoin ?? this.getExcitementPoin,
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
  });

  ExamsPercentage.fromJson(dynamic json) {
    examsGoal = json['examsGoal']?.toDouble();
    examsCount = json['examsCount']?.toDouble();
    percentage = json['percentage']?.toDouble();
  }

  double? examsGoal;
  double? examsCount;
  double? percentage;

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
  });

  BooksPercentage.fromJson(dynamic json) {
    booksGoal = json['booksGoal']?.toDouble();
    booksCount = json['booksCount']?.toDouble();
    percentage = json['percentage']?.toDouble();
  }

  double? booksGoal;
  double? booksCount;
  double? percentage;

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
  });

  TodayPercentage.fromJson(dynamic json) {
    booksGoal = json['booksGoal'];
    booksCount = json['booksCount']?.toDouble();
    percentage = json['percentage']?.toDouble();
  }

  int? booksGoal;
  double? booksCount;
  double? percentage;

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
  });

  WeekPercentageData.fromJson(dynamic json) {
    booksGoal = json['booksGoal']?.toDouble();
    booksCount = json['booksCount']?.toDouble();
    percentage = json['percentage']?.toDouble();
  }

  double? booksGoal;
  double? booksCount;
  double? percentage;

  WeekPercentageData copyWith({
    double? booksGoal,
    double? booksCount,
    double? percentage,
  }) =>
      WeekPercentageData(
        booksGoal: booksGoal ?? this.booksGoal,
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
