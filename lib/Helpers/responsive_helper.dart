import 'package:flutter/material.dart';

class ResponsiveHelper {
  final double width;
  final double height;
  final double fontSize;
  final double titleFontSize;

  static ResponsiveHelper _instance;

  factory ResponsiveHelper({
    @required double width,
    @required double height,
    @required double fontSize,
    @required double titleFontSize,
  }) {
    _instance ??= ResponsiveHelper._internal(
      width,
      height,
      fontSize,
      titleFontSize,
    );
    return _instance;
  }

  ResponsiveHelper._internal(
    this.width,
    this.height,
    this.fontSize,
    this.titleFontSize,
  );

  static ResponsiveHelper get instance {
    return _instance;
  }
}
