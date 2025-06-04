
import '../../../../../exports.dart';

class GetBrokerModel extends ResponseModel {
  GetBrokerModel({
    super.code,
    super.status,
    super.message,
    super.data,
  });

  GetBrokerModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ItemModel.fromJson(v));
      });
    }
  }
  GetBrokerModel copyWith({
    String? code,
    bool? status,
    String? message,
    List<ItemModel>? data,
  }) =>
      GetBrokerModel(
        code: code ?? this.code,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
