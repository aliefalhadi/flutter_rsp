// To parse this JSON data, do
//
//     final detailCourseModel = detailCourseModelFromJson(jsonString);

import 'dart:convert';

DetailCourseModel detailCourseModelFromJson(String str) => DetailCourseModel.fromJson(json.decode(str));

String detailCourseModelToJson(DetailCourseModel data) => json.encode(data.toJson());

class DetailCourseModel {
  DetailCourseModel({
    this.id,
    this.shortDescription,
    this.quistion,
    this.answer,
    this.quistionPhoto,
    this.materiCourse,
  });

  int id;
  String shortDescription;
  String quistion;
  String answer;
  String quistionPhoto;
  List<MateriCourse> materiCourse;

  factory DetailCourseModel.fromJson(Map<String, dynamic> json) => DetailCourseModel(
    id: json["id"],
    shortDescription: json["short-description"],
    quistion: json["quistion"],
    answer: json["answer"],
    quistionPhoto: json["quistion-photo"],
    materiCourse: List<MateriCourse>.from(json["materi course"].map((x) => MateriCourse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "short-description": shortDescription,
    "quistion": quistion,
    "answer": answer,
    "quistion-photo": quistionPhoto,
    "materi course": List<dynamic>.from(materiCourse.map((x) => x.toJson())),
  };
}

class MateriCourse {
  MateriCourse({
    this.id,
    this.section,
    this.data,
  });

  int id;
  String section;
  List<Datum> data;

  factory MateriCourse.fromJson(Map<String, dynamic> json) => MateriCourse(
    id: json["id"],
    section: json["section"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "section": section,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.url,
    this.timeIn,
  });

  int id;
  String title;
  String url;
  String timeIn;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    timeIn: json["time-in"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "time-in": timeIn,
  };
}
