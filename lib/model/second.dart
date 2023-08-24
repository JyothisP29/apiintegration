// To parse this JSON data, do
//
//     final getApi = getApiFromJson(jsonString);

import 'dart:convert';

GetApi getApiFromJson(String str) => GetApi.fromJson(json.decode(str));

class GetApi {
  int? statusCode;
  String? message;
  List<Datum>? data;

  GetApi({
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetApi.fromJson(Map<String, dynamic> json) => GetApi(
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  int? id;
  String? name;
  String? description;
  String? image;
  String? images;

  Datum({
    this.id,
    this.name,
    this.description,
    this.image,
    this.images,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        images: json["images"],
      );
}
