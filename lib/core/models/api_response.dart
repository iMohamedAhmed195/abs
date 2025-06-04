class ApiResponse {
  final String message;
  final bool status;
  final int statusCode;

  ApiResponse(this.message, this.status, this.statusCode);
}

class ApiResponseObject<object> extends ApiResponse {
  final object? objectData;

  ApiResponseObject(
      {required message, required status, required statusCode, this.objectData})
      : super(message, status, statusCode);
}

class ApiResponseList<list> extends ApiResponse {
  final List<list>? listData;
  final int? countPages;

  ApiResponseList(
      {required message,
      required status,
      required statusCode,
      this.listData,
      this.countPages})
      : super(message, status, statusCode);
}
