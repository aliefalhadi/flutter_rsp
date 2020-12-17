// To parse this JSON data, do
//
//     final dataAsSeenOnModel = dataAsSeenOnModelFromJson(jsonString);

import 'dart:convert';

DataAsSeenOnModel dataAsSeenOnModelFromJson(String str) => DataAsSeenOnModel.fromJson(json.decode(str));

String dataAsSeenOnModelToJson(DataAsSeenOnModel data) => json.encode(data.toJson());

class DataAsSeenOnModel {
  DataAsSeenOnModel({
    this.data,
  });

  List<Datum> data;

  factory DataAsSeenOnModel.fromJson(Map<String, dynamic> json) => DataAsSeenOnModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.photoUrl,
    this.linkUrl,
    this.name,
  });

  int id;
  String photoUrl;
  String linkUrl;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    photoUrl: json["photo_url"],
    linkUrl: json["link_url"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo_url": photoUrl,
    "link_url": linkUrl,
    "name": name,
  };
}
