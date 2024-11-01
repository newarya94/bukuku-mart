// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bukuku_mart/service/cookies.dart';
import 'package:get/get.dart';

import '../../../route/app_route.dart';

class SplashScreenController extends GetxController {
  final cookieCustomController = Get.find<CookiesCustomController>();

  var a = false.obs;
  var b = false.obs;
  var c = false.obs;
  var d = false.obs;
  var e = false.obs;
  var r = false.obs;
  var h = Get.height.obs;
  var w = Get.width.obs;

  Future<void> init() async {
    Timer(Duration(milliseconds: 400), () {
      a.value = true;
    });
    Timer(Duration(milliseconds: 400), () {
      b.value = true;
    });
    Timer(Duration(milliseconds: 1300), () {
      c.value = true;
    });
    Timer(Duration(milliseconds: 1700), () {
      e.value = true;
    });
    Timer(Duration(milliseconds: 3400), () {
      d.value = true;
    });
    Timer(Duration(milliseconds: 3850), () {
      r.value = true;
      cekLogin();
    });
  }

  Future<void> cekLogin() async {
    final isLogin = await cookieCustomController.checkAutoLogin();
    print(isLogin);
    if (isLogin == true) {
      Get.offNamed(ROUTES.PAGESALESTRANSACTION);
    } else {
      Get.offNamed(ROUTES.PAGELOGIN);
    }
  }
}
