class LoginResponseModel {
  String? message;
  int? statusCode;
  bool? success;
  Data? data;

  LoginResponseModel({this.message, this.statusCode, this.success, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    statusCode = json["statusCode"];
    success = json["success"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["message"] = message;
    json["statusCode"] = statusCode;
    json["success"] = success;
    if (data != null) {
      json["data"] = data?.toJson();
    }
    return json;
  }
}

class Data {
  String? token;
  Detail? detail;

  Data({this.token, this.detail});

  Data.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    detail = json["detail"] == null ? null : Detail.fromJson(json["detail"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["token"] = token;
    if (detail != null) {
      json["detail"] = detail?.toJson();
    }
    return json;
  }
}

class Detail {
  int? uid;
  String? fullName;
  String? email;
  String? createdAt;
  String? updatedAt;

  Detail({this.uid, this.fullName, this.email, this.createdAt, this.updatedAt});

  Detail.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    fullName = json["fullName"];
    email = json["email"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["uid"] = uid;
    json["fullName"] = fullName;
    json["email"] = email;
    json["createdAt"] = createdAt;
    json["updatedAt"] = updatedAt;
    return json;
  }
}
