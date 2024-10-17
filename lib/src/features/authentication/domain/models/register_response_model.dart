class RegisterResponseModel {
  String? message;
  int? statusCode;
  bool? success;
  Data? data;

  RegisterResponseModel(
      {this.message, this.statusCode, this.success, this.data});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? uid;
  String? fullName;
  String? email;
  String? createdAt;
  String? updatedAt;

  Data({this.uid, this.fullName, this.email, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
