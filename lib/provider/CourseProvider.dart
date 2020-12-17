import 'dart:developer';
import 'dart:io';

import 'package:flutterstarter/locator.dart';
import 'package:flutterstarter/models/DataAlumniReportModel.dart';
import 'package:flutterstarter/models/DataAsSeenOnModel.dart';
import 'package:flutterstarter/models/DataPartnerModel.dart';
import 'package:flutterstarter/provider/BaseProvider.dart';
import 'package:flutterstarter/services/DataAlumniReportService.dart';
import 'package:flutterstarter/services/DataAsSeenOnService.dart';
import 'package:flutterstarter/services/DataPartnerService.dart';
import 'package:flutterstarter/shareds/ViewState.dart';

class CourseProvider extends BaseProvider {
  DataAlumniReportService dataAlumniReportService = locator<DataAlumniReportService>();
  DataAlumniReportModel dataAlumniReportModel;

  void main() async{
     getDaftarAlumniReport();
  }

  void getDaftarAlumniReport() async {
    try {
      dataAlumniReportModel = await dataAlumniReportService.getDaftarAlumniReport();
      print(dataAlumniReportModel);
      notifyListeners();
    } on SocketException catch (e) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      setState(ViewState.FetchNull);
    }
  }
}
