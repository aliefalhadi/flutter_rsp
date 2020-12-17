import 'package:flutterstarter/provider/HomeProvider.dart';
import 'package:flutterstarter/provider/KamusProvider.dart';
import 'package:flutterstarter/provider/LoginProvider.dart';
import 'package:flutterstarter/provider/ModulProvider.dart';
import 'package:flutterstarter/provider/RegisterProvider.dart';
import 'package:flutterstarter/services/ApiInterceptors.dart';
import 'package:flutterstarter/services/DatabaseService.dart';
import 'package:flutterstarter/services/EventBusService.dart';
import 'package:flutterstarter/services/KamusService.dart';
import 'package:flutterstarter/services/ModulService.dart';
import 'package:flutterstarter/services/UserService.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiInterceptors());


  //services
  locator.registerLazySingleton(() => KamusService());
  locator.registerLazySingleton(() => ModulService());
  locator.registerLazySingleton(() => EventBusService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => UserService());


  // provider
  locator.registerFactory(() => LoginProvider());
  locator.registerFactory(() => RegisterProvider());
  locator.registerFactory(() => HomeProvider());
  locator.registerFactory(() => KamusProvider());
  locator.registerFactory(() => ModulProvider());
}