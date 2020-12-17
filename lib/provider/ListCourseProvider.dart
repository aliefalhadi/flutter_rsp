import 'dart:developer';
import 'dart:io';

import 'package:flutterstarter/locator.dart';
import 'package:flutterstarter/models/ListCourseModel.dart';
import 'package:flutterstarter/provider/BaseProvider.dart';
import 'package:flutterstarter/services/ListCourseService.dart';
import 'package:flutterstarter/shareds/ViewState.dart';

class ListCourseProvider extends BaseProvider {
  ListCourseService listCourseService = locator<ListCourseService>();
  ListCourseModel listCourseModel;

  void main() async{
    getListCourse();
  }

  void getListCourse() async {
    try {
      log('testt');
      listCourseModel = await listCourseService.getListCourse();
      print(listCourseModel);
      notifyListeners();
    } on SocketException catch (_) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      setState(ViewState.FetchNull);
    }
  }
}
