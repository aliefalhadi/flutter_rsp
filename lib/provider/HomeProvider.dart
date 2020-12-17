import 'dart:developer';
import 'dart:io';

import 'package:flutterstarter/locator.dart';
import 'package:flutterstarter/models/DataAsSeenOnModel.dart';
import 'package:flutterstarter/models/DataPartnerModel.dart';
import 'package:flutterstarter/provider/BaseProvider.dart';
import 'package:flutterstarter/services/DataAsSeenOnService.dart';
import 'package:flutterstarter/services/DataPartnerService.dart';
import 'package:flutterstarter/shareds/ViewState.dart';

class HomeProvider extends BaseProvider {
  DataPartnerService dataPartnerService = locator<DataPartnerService>();
  DataAsSeenOnService dataAsSeenOnService = locator<DataAsSeenOnService>();
  DataPartnerModel dataPartnerModel;
  DataAsSeenOnModel dataAsSeenOnModel;

  void main() async{
     getDaftarAsSeenOn();
    getDaftarPartner();
   //
   // notifyListeners();
  }

  void getDaftarPartner() async {
    try {
      dataPartnerModel = await dataPartnerService.getDaftarPartner();
      print(dataPartnerModel);
      notifyListeners();
    } on SocketException catch (e) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      setState(ViewState.FetchNull);
    }
  }

  void getDaftarAsSeenOn() async {
    try {
      dataAsSeenOnModel = await dataAsSeenOnService.getDaftarAsSeenOn();
      notifyListeners();
    } on SocketException catch (e) {
      setState(ViewState.ErrConnection);
    } catch (e) {
      setState(ViewState.FetchNull);
    }
  }
}
