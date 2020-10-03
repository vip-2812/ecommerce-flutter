import 'package:custom_splash/custom_splash.dart';
import 'package:ecommerce_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    home: CustomSplash(
      imagePath: 'images/successful_purchase.png',
      backGroundColor: Colors.white,
      animationEffect: 'fade-in',
      logoSize: 300,
      home: HomePage(),
      duration: 5000,
      type: CustomSplashType.StaticDuration,
    ),
  ));
}