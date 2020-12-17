import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutterstarter/locator.dart';
import 'package:flutterstarter/services/ApiInterceptors.dart';

class Service {
  Dio dio = locator<ApiInterceptors>().dio;


  Future get(String url) async {
    try {
      if (await locator<ApiInterceptors>().checkConnection()) {
        final response =
        dio.get(url);
        return response;
      } else {
        print('no');
        throw SocketException('no_internet');
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        print('timeout');
      }
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        print('timeout2');
      }
    }
  }


  Future post(String url, var data) async {
    if (await locator<ApiInterceptors>().checkConnection()) {
      final response = await dio.post(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }),
          data: data);
      return response;
    } else {
      print('no');
      throw SocketException('no_internet');
    }
  }


  Future patch(String url, var data) async {
    if (await locator<ApiInterceptors>().checkConnection()) {
      final response = await dio.patch(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }),
          data: data);
      return response;
    } else {
      print('no');
      throw SocketException('no_internet');
    }
  }

}