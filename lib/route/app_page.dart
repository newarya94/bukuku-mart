// ignore_for_file: prefer_const_constructors

import 'package:bukuku_mart/route/app_route.dart';
import 'package:get/get.dart';

import '../module/Login/binding/login_b.dart';
import '../module/Login/view/login_v.dart';
import '../module/Main/main.dart';
import '../module/Splash/view/splash_v.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: ROUTES.PAGEMAIN,
      page: () => MyApp(),
    ),
    GetPage(
      name: ROUTES.PAGESPLASH,
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: ROUTES.PAGELOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}