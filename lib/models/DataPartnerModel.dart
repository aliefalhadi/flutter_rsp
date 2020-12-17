// To parse this JSON data, do
//
//     final dataPartnerModel = dataPartnerModelFromJson(jsonString);

import 'dart:convert';

DataPartnerModel dataPartnerModelFromJson(String str) => DataPartnerModel.fromJson(json.decode(str));

String dataPartnerModelToJson(DataPartnerModel data) => json.encode(data.toJson());

class DataPartnerModel {
  DataPartnerModel({
    this.data,
  });

  List<Datum> data;

  factory DataPartnerModel.fromJson(Map<String, dynamic> json) => DataPartnerModel(
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
    this.name,
  });

  int id;
  String photoUrl;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    photoUrl: json["photo_url"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo_url": photoUrl,
    "name": name,
  };
}
