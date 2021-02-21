import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';

class ImageButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function function;
  final String imgUrl;

  ImageButton({this.title, this.color, this.function, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 60,
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
              style: AppTextStyle.smallBold.copyWith(color: Colors.white),
            ),
            SizedBox(
              width: 50,
              child: Image.asset(
                imgUrl,
                color: Colors.white70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
