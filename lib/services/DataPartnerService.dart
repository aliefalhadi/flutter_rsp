import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterstarter/models/DaftarKataModel.dart';
import 'package:flutterstarter/models/DataPartnerModel.dart';
import 'package:flutterstarter/services/Service.dart';

class DataPartnerService extends Service {
  Future getDaftarPartner() async {
    try {
      var url = "https://raw.githubusercontent.com/cahyo-refactory/RSP-DataSet-SkilTest-FE/main/partner.json";
      print(url);
      var response = await get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        DataPartnerModel dataPartnerModel =
        dataPartnerModelFromJson(response.data);
        return dataPartnerModel;
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