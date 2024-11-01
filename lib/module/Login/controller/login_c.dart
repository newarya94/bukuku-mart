// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../service/cookies.dart';
import '../../../utils/bottomsheet.dart';
import '../../../utils/dialog.dart';

class LoginController extends GetxController {
  final cookieCustomController = Get.find<CookiesCustomController>();
  final storage = GetStorage();
  var hidden = true.obs;
  var rememberme = false.obs;
  bool loading = false;

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void onInit() async {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    cekCacheUser();
  }

  @override
  void onClose() async {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void cekCacheUser() {
    if (storage.read('cacheUser') != null) {
      final data = storage.read('cacheUser') as Map<String, dynamic>;
      usernameController.text = data['username'];
      passwordController.text = data['password'];
      rememberme.value = data['rememberme'];
    }
  }

  Future<dynamic> submitLogin() async {
    if (!Get.isDialogOpen!) {
      loadingMain();
    }
    await Future.delayed(Duration(seconds: 2));
    final users = cookieCustomController.getUsers();
    final isUserValid = users.any((user) =>
        user['username'] == usernameController.text &&
        user['password'] == passwordController.text);

    Get.back();

    Map<String, dynamic>? user;
    for (var u in users) {
      if (u['username'] == usernameController.text &&
          u['password'] == passwordController.text) {
        user = u;
        break;
      }
    }

    if (user != null) {
      String fullname = user['fullname'] ?? '';
      // Durasi login 8 jam
      await cookieCustomController.saveLoginStatus(28800);
      if (rememberme.isTrue) {
        await cookieCustomController.saveCacheLogin(
            usernameController.text, passwordController.text, rememberme.value);
      } else {
        await cookieCustomController.deleteCacheLogin();
      }
      loginSuccessBottomSheet(fullname);
    } else {
      loginFailedBottomSheet();
    }
  }
}
