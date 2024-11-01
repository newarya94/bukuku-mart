// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

loadingMain() {
  Get.defaultDialog(
    title: "",
    content: Column(
      children: [
        LottieBuilder.asset(
          'img/loading_apple.json',
          width: 60,
          height: 60,
          fit: BoxFit.fill,
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            "Please wait...",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        )
      ],
    ),
    onWillPop: () async => false,
  );
}
