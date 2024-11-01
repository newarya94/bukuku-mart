// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../route/app_page.dart';
import '../../service/cookies.dart';
import '../Splash/view/splash_v.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cookieCustomController =
        Get.put(CookiesCustomController(), permanent: true);
    cookieCustomController.initializeUsers();
    return GetMaterialApp(
      onInit: () => CookiesCustomController(),
      debugShowCheckedModeBanner: false,
      title: 'Bukuku Mart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenView(),
      getPages: AppPages.pages,
    );
  }
}
