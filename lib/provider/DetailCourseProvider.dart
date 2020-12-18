import 'dart:developer';
import 'dart:io';

import 'package:flutterstarter/locator.dart';
import 'package:flutterstarter/models/DetailCoursemodel.dart';
import 'package:flutterstarter/models/ListCourseModel.dart';
import 'package:flutterstarter/provider/BaseProvider.dart';
import 'package:flutterstarter/services/ListCourseService.dart';
import 'package:flutterstarter/shareds/ViewState.dart';

class DetailCourseProvider extends BaseProvider {
  ListCourseService listCourseService = locator<ListCourseService>();
  DetailCourseModel detailCourseModel;

  void main() async{
    setState(ViewState.Fetching);
    await getDetailCourse();
    setState(ViewState.Idle);
  }

  Future getDetailCourse() async {
    try {
      log('testt');
      detailCourseModel = await listCourseService.getDetailCourse();
      print(detailCourseModel);
      notifyListeners();
    } on SocketException catch (_) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      setState(ViewState.FetchNull);
    }
  }
}
