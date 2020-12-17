import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterstarter/models/DaftarKataModel.dart';
import 'package:flutterstarter/models/DataAsSeenOnModel.dart';
import 'package:flutterstarter/models/DataPartnerModel.dart';
import 'package:flutterstarter/services/Service.dart';

class DataAsSeenOnService extends Service {
  Future getDaftarAsSeenOn() async {
    try {
      var url = "https://raw.githubusercontent.com/cahyo-refactory/RSP-DataSet-SkilTest-FE/main/seen_on.json";

      var response = await get(url);

      if (response.statusCode == 200) {
        DataAsSeenOnModel dataAsSeenOnModel =
        dataAsSeenOnModelFromJson(response.data);

        return dataAsSeenOnModel;
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