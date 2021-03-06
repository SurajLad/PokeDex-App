import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/routes/app_pages.dart';
import 'package:my_pokedex/routes/routes.dart';
import 'package:my_pokedex/utitliy/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokeDex',
      initialRoute: Routes.SPLASH,
      getPages: AppPages.appPages,
      defaultTransition: Transition.fade,
      theme: ThemeData(
        fontFamily: FONT,
      ),
      transitionDuration: Duration(milliseconds: 300),
    );
  }
}
