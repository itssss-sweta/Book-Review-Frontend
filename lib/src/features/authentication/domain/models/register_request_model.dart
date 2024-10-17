class RegisterRequestModel {
  String? fullName;
  String? email;
  String? password;

  RegisterRequestModel({this.fullName, this.email, this.password});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    fullName = json["fullName"];
    email = json["email"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["fullName"] = fullName;
    json["email"] = email;
    json["password"] = password;
    return json;
  }
}
