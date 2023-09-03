// To parse this JSON data, do
//
//     final governoratesModel = governoratesModelFromJson(jsonString);

import 'dart:convert';

GovernoratesModel governoratesModelFromJson(String str) =>
    GovernoratesModel.fromJson(json.decode(str));

String governoratesModelToJson(GovernoratesModel data) =>
    json.encode(data.toJson());

class GovernoratesModel {
  String type;
  String name;
  String database;
  List<GovernoratesData> data;

  GovernoratesModel({
    required this.type,
    required this.name,
    required this.database,
    required this.data,
  });

  factory GovernoratesModel.fromJson(Map<String, dynamic> json) =>
      GovernoratesModel(
        type: json["type"],
        name: json["name"],
        database: json["database"],
        data: List<GovernoratesData>.from(
            json["data"].map((x) => GovernoratesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "database": database,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GovernoratesData {
  String id;
  String governorateNameAr;
  String governorateNameEn;

  GovernoratesData({
    required this.id,
    required this.governorateNameAr,
    required this.governorateNameEn,
  });

  factory GovernoratesData.fromJson(Map<String, dynamic> json) =>
      GovernoratesData(
        id: json["id"],
        governorateNameAr: json["governorate_name_ar"],
        governorateNameEn: json["governorate_name_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "governorate_name_ar": governorateNameAr,
        "governorate_name_en": governorateNameEn,
      };
}
