import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterstarter/models/DaftarKataModel.dart';
import 'package:flutterstarter/models/DataAlumniReportModel.dart';
import 'package:flutterstarter/models/DataAsSeenOnModel.dart';
import 'package:flutterstarter/models/DataPartnerModel.dart';
import 'package:flutterstarter/models/DetailCoursemodel.dart';
import 'package:flutterstarter/models/ListCourseModel.dart';
import 'package:flutterstarter/services/Service.dart';

class ListCourseService extends Service {
  Future getListCourse() async {
    try {
      var url = "https://raw.githubusercontent.com/cahyo-refactory/RSP-DataSet-SkilTest-FE/main/list-course.json";

      var response = await get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        ListCourseModel listCourseModel =
        listCourseModelFromJson(response.data);
        print(listCourseModel);
        return listCourseModel;
      } else {
        throw ('data tidak ditemukan');
      }
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }

  Future getDetailCourse() async {
    try {
      var url = "https://raw.githubusercontent.com/cahyo-refactory/RSP-DataSet-SkilTest-FE/main/detail-course.json";

      var response = await get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        DetailCourseModel detailCourseModel =
        detailCourseModelFromJson(response.data);
        print(detailCourseModel);
        return detailCourseModel;
      } else {
        throw ('data tidak ditemukan');
      }
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }
}