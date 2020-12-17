import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterstarter/models/DaftarKataModel.dart';
import 'package:flutterstarter/models/DataAlumniReportModel.dart';
import 'package:flutterstarter/models/DataAsSeenOnModel.dart';
import 'package:flutterstarter/models/DataPartnerModel.dart';
import 'package:flutterstarter/services/Service.dart';

class DataAlumniReportService extends Service {
  Future getDaftarAlumniReport() async {
    try {
      var url = "https://raw.githubusercontent.com/cahyo-refactory/RSP-DataSet-SkilTest-FE/main/alumni-report.json";

      var response = await get(url);

      if (response.statusCode == 200) {
        DataAlumniReportModel dataAlumniReportModel =
        dataAlumniReportModelFromJson(response.data);

        return dataAlumniReportModel;
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