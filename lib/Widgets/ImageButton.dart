import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function function;

  ImageButton({this.title, this.color, this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 2.55,
      height: 50,
      child: FlatButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 37,
              child: Image.asset('Assets/poke_ball.png'),
            )
          ],
        ),
      ),
    );
  }
}
