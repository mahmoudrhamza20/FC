// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool status;
  String message;
  String token;
  User user;

  UserModel({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String name;
  String email;
  String language;
  String phone;
  dynamic address;
  String photo;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.language,
    required this.phone,
    required this.address,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        language: json["language"],
        phone: json["phone"],
        address: json["address"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "language": language,
        "phone": phone,
        "address": address,
        "photo": photo,
      };
}
