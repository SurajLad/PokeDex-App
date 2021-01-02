import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function function;

  ImageButton({this.title, this.color, this.function});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: Get.width / 2.55,
      height: 50,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: function,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
