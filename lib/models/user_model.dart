// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromMap(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromMap(String str) =>
    UserDataModel.fromMap(json.decode(str));

String userDataModelToMap(UserDataModel data) => json.encode(data.toMap());

class UserDataModel {
  final String name;
  final String email;
  final String password;
  final String token;

  UserDataModel({
    required this.name,
    required this.email,
    required this.password,
    required this.token,
  });

  factory UserDataModel.fromMap(Map<String, dynamic> json) => UserDataModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
        "token": token,
      };
}
