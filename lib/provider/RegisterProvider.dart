import 'package:flutterstarter/provider/BaseProvider.dart';
import 'package:geolocator/geolocator.dart';

class RegisterProvider extends BaseProvider {
  String lokasiLongitude = '';
  String lokasiLatitude = '';

  void getLokasi() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lokasiLatitude = position.latitude.toString();
    lokasiLongitude = position.longitude.toString();
    notifyListeners();
  }
}