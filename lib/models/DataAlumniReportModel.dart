// To parse this JSON data, do
//
//     final dataAlumniReportModel = dataAlumniReportModelFromJson(jsonString);

import 'dart:convert';

DataAlumniReportModel dataAlumniReportModelFromJson(String str) => DataAlumniReportModel.fromJson(json.decode(str));

String dataAlumniReportModelToJson(DataAlumniReportModel data) => json.encode(data.toJson());

class DataAlumniReportModel {
  DataAlumniReportModel({
    this.data,
  });

  List<Datum> data;

  factory DataAlumniReportModel.fromJson(Map<String, dynamic> json) => DataAlumniReportModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.user,
    this.star,
    this.title,
    this.description,
  });

  int id;
  User user;
  int star;
  String title;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    user: User.fromJson(json["user"]),
    star: json["star"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "star": star,
    "title": title,
    "description": description,
  };
}

class User {
  User({
    this.userId,
    this.photoUrl,
    this.name,
    this.from,
  });

  int userId;
  String photoUrl;
  String name;
  String from;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    photoUrl: json["photo_url"],
    name: json["name"],
    from: json["from"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "photo_url": photoUrl,
    "name": name,
    "from": from,
  };
}
