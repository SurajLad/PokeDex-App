import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/UI/splash_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PokeDex',
      theme: ThemeData(
        // fontFamily: 'Montserrat-Regular',
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}
