// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route/app_route.dart';

void loginFailedBottomSheet() {
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Login Gagal",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Username atau password yang Anda masukkan salah.",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 18),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 38, 108, 141),
            ),
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}

void loginSuccessBottomSheet(String username) {
  Get.bottomSheet(
    Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Login Sukses",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Selamat datang, $username!",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.offNamed(ROUTES.PAGESALESTRANSACTION);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 38, 108, 141),
            ),
            child: Text("Lanjutkan"),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
  Future.delayed(Duration(seconds: 2), () {
    Get.back();
    Get.offNamed(ROUTES.PAGESALESTRANSACTION);
  });
}
