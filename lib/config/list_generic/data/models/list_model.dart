
import '../../../../exports.dart';

class ListModel<T> {
  int? numberOfPages;
  List<T>? list;
  ListModel({this.numberOfPages, this.list});
}

abstract class ListResponseModel<T> extends ResponseModel {
  ListResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = ListModel(list: <T>[]);
    if (json['data'] != null) {
      if (json['data'] is Map) {
        data.numberOfPages = json['data']['numberOfPages'];
        if (json['data']['list'] != null)
          json['data']['list'].forEach((v) {
            data.list?.add(getFromJsonFunction(v));
          });
      } else if (json['data'] is List) {
        json['data'].forEach((v) {
          data.list?.add(getFromJsonFunction(v));
        });
      }
    }
  }

  Function(Map<String, dynamic> data) get getFromJsonFunction;
}
