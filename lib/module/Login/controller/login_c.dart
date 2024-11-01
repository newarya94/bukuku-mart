import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/cookies.dart';

class LoginController extends GetxController{
   final cookieCustomController = Get.find<CookiesCustomController>();

  bool loading = false;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
}