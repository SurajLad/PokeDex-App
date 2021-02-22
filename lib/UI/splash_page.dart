import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/UI/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 3200), () {
      Get.off(HomePage());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveHelper();
    ResponsiveHelper.instance.width = Get.width;
    ResponsiveHelper.instance.height = Get.height;
    ResponsiveHelper.instance.fontSize = Get.width > 300 ? 18 : 16;
    ResponsiveHelper.instance.titleFontSize = Get.width > 300 ? 22 : 20;
    return Scaffold(
      body: FlareActor(
        "Assets/poke_splash.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "idle",
        antialias: true,
      ),
    );
  }
}
