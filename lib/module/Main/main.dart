

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route/app_page.dart';
import '../../service/cookies.dart';
import '../Splash/view/splash_v.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CookiesCustomController(), permanent: true);
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
