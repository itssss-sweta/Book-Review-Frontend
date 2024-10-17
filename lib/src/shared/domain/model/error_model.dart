class ErrorModel {
  String? message;
  int? statusCode;
  bool? success;
  String? error;

  ErrorModel({this.message, this.statusCode, this.success, this.error});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    statusCode = json["statusCode"];
    success = json["success"];
    error = json["error"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["message"] = message;
    json["statusCode"] = statusCode;
    json["success"] = success;
    json["error"] = error;
    return json;
  }
}
