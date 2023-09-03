// To parse this JSON data, do
//
//     final citiesModel = citiesModelFromJson(jsonString);

import 'dart:convert';

CitiesModel citiesModelFromJson(String str) =>
    CitiesModel.fromJson(json.decode(str));

String citiesModelToJson(CitiesModel data) => json.encode(data.toJson());

class CitiesModel {
  String type;
  String name;
  String database;
  List<CitiesData> data;

  CitiesModel({
    required this.type,
    required this.name,
    required this.database,
    required this.data,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
        type: json["type"],
        name: json["name"],
        database: json["database"],
        data: List<CitiesData>.from(
            json["data"].map((x) => CitiesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "database": database,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CitiesData {
  String id;
  String governorateId;
  String cityNameAr;
  String cityNameEn;

  CitiesData({
    required this.id,
    required this.governorateId,
    required this.cityNameAr,
    required this.cityNameEn,
  });

  factory CitiesData.fromJson(Map<String, dynamic> json) => CitiesData(
        id: json["id"],
        governorateId: json["governorate_id"],
        cityNameAr: json["city_name_ar"],
        cityNameEn: json["city_name_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "governorate_id": governorateId,
        "city_name_ar": cityNameAr,
        "city_name_en": cityNameEn,
      };
}
