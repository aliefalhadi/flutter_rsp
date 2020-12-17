import 'package:flutterstarter/provider/BaseProvider.dart';
import 'package:flutterstarter/services/UserService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../locator.dart';
import '../locator.dart';
import '../shareds/ViewState.dart';
import '../shareds/ViewState.dart';

class RegisterProvider extends BaseProvider {
  String lokasiLongitude = '';
  String lokasiLatitude = '';
  final picker = ImagePicker();
  String foto = '';
  String alamatEmail = '';
  int loginCount=0;

  void getLokasi() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lokasiLatitude = position.latitude.toString();
    lokasiLongitude = position.longitude.toString();
    notifyListeners();
  }

  void getImageFile(ImageSource source) async {
    var imagePath = await picker.getImage(
        source: source, imageQuality: 70, maxHeight: 640, maxWidth: 640);

    foto = imagePath.path;
    notifyListeners();
  }

  Future<bool> register() async{
    setState(ViewState.Fetching);
    //cek apakah email sudah terdaftar atau belum
    //kalau belum simpan di db
    List file = await locator<UserService>().getDataByEmail(alamatEmail);
    print(file);
    if(file == null){
      await locator<UserService>().addData([alamatEmail, 0]);
      setState(ViewState.Idle);
      return true;
    }
    setState(ViewState.Idle);
    return false;
  }
}
