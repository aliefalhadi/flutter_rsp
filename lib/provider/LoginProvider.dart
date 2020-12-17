import 'package:flutterstarter/provider/BaseProvider.dart';
import 'package:flutterstarter/services/DatabaseService.dart';
import 'package:geolocator/geolocator.dart';

import '../locator.dart';

class LoginProvider extends BaseProvider {
  String lokasiLongitude = '';
  String lokasiLatitude = '';

  void getLokasi() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lokasiLatitude = position.latitude.toString();
    lokasiLongitude = position.longitude.toString();
    List<Map> list = await locator<DatabaseService>().database.rawQuery('SELECT * FROM login_story where email= ?',['alief@gmail.com3']);
    print(list);
    notifyListeners();
  }
}