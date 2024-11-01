// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_c.dart';


class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
     final c = Get.put(SplashScreenController(), permanent: true);
    return FutureBuilder(
        future: c.init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ContentSplash(splashController: c);
          } else {
            return ContentSplash(splashController: c);
          }
        });
  }
}

class ContentSplash extends StatelessWidget {
  const ContentSplash({
    super.key,
    required this.splashController,
  });

  final SplashScreenController splashController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Obx(
          () => Column(
            children: [
              AnimatedContainer(
                duration: Duration(
                    milliseconds: splashController.d.value ? 900 : 2500),
                curve: splashController.d.value
                    ? Curves.fastLinearToSlowEaseIn
                    : Curves.elasticOut,
                height: splashController.d.value
                    ? 0
                    : splashController.a.value
                        ? splashController.h.value / 2.5
                        : 20,
                width: 20,
              ),
              AnimatedContainer(
                duration: Duration(
                    seconds: splashController.d.value
                        ? 1
                        : splashController.c.value
                            ? 3
                            : 10),
                curve: Curves.fastLinearToSlowEaseIn,
                height: splashController.d.value
                    ? splashController.h.value
                    : splashController.c.value
                        ? 200
                        : 50,
                width: splashController.d.value
                    ? splashController.w.value
                    : splashController.c.value
                        ? 200
                        : 50,
                decoration: splashController.e.value
                    ? BoxDecoration(
                        color: Colors.white,
                      )
                    : BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("img/bukuku.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: splashController.c.value
                            ? BorderRadius.only()
                            : BorderRadius.circular(50),
                      ),
                child: Center(
                  child: splashController.e.value
                      ? AnimatedTextKit(
                          totalRepeatCount: 100,
                          animatedTexts: [
                            FadeAnimatedText(
                              'Bukuku Mart',
                              duration: Duration(milliseconds: 1700),
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
