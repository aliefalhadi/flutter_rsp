import 'package:flutterstarter/provider/CourseProvider.dart';
import 'package:flutterstarter/provider/DetailCourseProvider.dart';
import 'package:flutterstarter/provider/HomeProvider.dart';
import 'package:flutterstarter/provider/KamusProvider.dart';
import 'package:flutterstarter/provider/ListCourseProvider.dart';
import 'package:flutterstarter/provider/LoginProvider.dart';
import 'package:flutterstarter/provider/ModulProvider.dart';
import 'package:flutterstarter/provider/RegisterProvider.dart';
import 'package:flutterstarter/services/ApiInterceptors.dart';
import 'package:flutterstarter/services/DataAlumniReportService.dart';
import 'package:flutterstarter/services/DataAsSeenOnService.dart';
import 'package:flutterstarter/services/DataPartnerService.dart';
import 'package:flutterstarter/services/DatabaseService.dart';
import 'package:flutterstarter/services/EventBusService.dart';
import 'package:flutterstarter/services/KamusService.dart';
import 'package:flutterstarter/services/ListCourseService.dart';
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
  locator.registerLazySingleton(() => DataPartnerService());
  locator.registerLazySingleton(() => DataAsSeenOnService());
  locator.registerLazySingleton(() => DataAlumniReportService());
  locator.registerLazySingleton(() => ListCourseService());


  // provider
  locator.registerFactory(() => LoginProvider());
  locator.registerFactory(() => RegisterProvider());
  locator.registerFactory(() => HomeProvider());
  locator.registerFactory(() => KamusProvider());
  locator.registerFactory(() => ModulProvider());
  locator.registerFactory(() => CourseProvider());
  locator.registerFactory(() => ListCourseProvider());
  locator.registerFactory(() => DetailCourseProvider());
}