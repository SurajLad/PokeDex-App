class ResponsiveHelper {
  double width;
  double height;
  double fontSize;
  double titleFontSize;

  static ResponsiveHelper _instance;

  factory ResponsiveHelper({
    double width,
    double height,
    double fontSize,
    double titleFontSize,
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
