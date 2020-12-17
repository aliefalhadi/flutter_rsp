// To parse this JSON data, do
//
//     final listCourseModel = listCourseModelFromJson(jsonString);

import 'dart:convert';

ListCourseModel listCourseModelFromJson(String str) => ListCourseModel.fromJson(json.decode(str));

String listCourseModelToJson(ListCourseModel data) => json.encode(data.toJson());

class ListCourseModel {
  ListCourseModel({
    this.data,
  });

  List<Datum> data;

  factory ListCourseModel.fromJson(Map<String, dynamic> json) => ListCourseModel(
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
    this.title,
    this.shortDescription,
    this.linkUrl,
    this.user,
  });

  int id;
  String photoUrl;
  String title;
  String shortDescription;
  String linkUrl;
  User user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    photoUrl: json["photo_url"] == null ? null : json["photo_url"],
    title: json["title"] == null ? null : json["title"],
    shortDescription: json["short_description"] == null ? null : json["short_description"],
    linkUrl: json["link_url"] == null ? null : json["link_url"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "photo_url": photoUrl == null ? null : photoUrl,
    "title": title == null ? null : title,
    "short_description": shortDescription == null ? null : shortDescription,
    "link_url": linkUrl == null ? null : linkUrl,
    "user": user == null ? null : user.toJson(),
  };
}

class User {
  User({
    this.userId,
    this.photoUrl,
    this.name,
  });

  int userId;
  String photoUrl;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    photoUrl: json["photo_url"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "photo_url": photoUrl,
    "name": name,
  };
}
