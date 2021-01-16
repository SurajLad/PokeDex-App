import 'package:flutter/material.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';

class AppTextStyle {
  static TextStyle small = TextStyle(
    fontSize: ResponsiveHelper.instance.fontSize - 4,
    color: Colors.black,
  );

  static TextStyle regular = TextStyle(
    fontSize: ResponsiveHelper.instance.fontSize,
    color: Colors.black,
  );

  static TextStyle medium = TextStyle(
    fontSize: ResponsiveHelper.instance.fontSize + 2,
    color: Colors.black,
  );

  static TextStyle large = TextStyle(
    fontSize: ResponsiveHelper.instance.fontSize + 4,
    color: Colors.black,
  );

  // =============================================

  static TextStyle smallBold = TextStyle(
    fontSize: ResponsiveHelper.instance.fontSize - 4,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle regularBold = TextStyle(
    fontSize: ResponsiveHelper.instance.fontSize,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle mediumBold = TextStyle(
    fontSize: ResponsiveHelper.instance.fontSize + 2,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle largeBold = TextStyle(
    fontSize: ResponsiveHelper.instance.fontSize + 4,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
