import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/UI/home_page.dart';
import 'package:my_pokedex/utitliy/constants.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    scheduleMicrotask(() async {
      await AppImages.preCacheAssets(context);
      // Timer(Duration(milliseconds: 2800), () {
      //   Get.off(
      //     HomePage(),
      //   );
      // });
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
    return SplashScreen.navigate(
      backgroundColor: Colors.white,
      name: 'Assets/poke_splash.flr',
      height: Get.height,
      next: (_) => HomePage(),
      until: () => Future.delayed(Duration(seconds: 2)),
      startAnimation: 'idle',
      fit: BoxFit.fitHeight,
    );
  }
}
