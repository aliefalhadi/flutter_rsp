import 'package:flutterstarter/provider/BaseProvider.dart';
import 'package:flutterstarter/services/DatabaseService.dart';
import 'package:flutterstarter/services/UserService.dart';
import 'package:flutterstarter/shareds/ViewState.dart';
import 'package:geolocator/geolocator.dart';

import '../locator.dart';

class LoginProvider extends BaseProvider {
  String lokasiLongitude = '';
  String lokasiLatitude = '';
  UserService userService = locator<UserService>();
  String alamatEmail = '';
  //loginCount untuk menyimpan jumlah login email
  int loginCount=0;

  void getLokasi() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lokasiLatitude = position.latitude.toString();
    lokasiLongitude = position.longitude.toString();
    List<Map> list = await locator<DatabaseService>().database.rawQuery('SELECT * FROM login_story');
    print(list);
    notifyListeners();
  }

  Future<bool> login() async{
    setState(ViewState.Fetching);
    //cek apakah email sudah terdaftar atau belum
    //kalau belum simpan di db
    List file = await userService.getDataByEmail(alamatEmail);
    print(file);
    if(file.isNotEmpty){
      loginCount = file[0]['count']+1;

      //update countlogin user di db
      await userService.updateLoginCount([loginCount, alamatEmail]);
      setState(ViewState.Idle);
      return true;
    }
    setState(ViewState.Idle);
    return false;
  }
}