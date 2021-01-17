import 'package:flutter/material.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/pokemon.dart';

class AboutTab extends StatelessWidget {
  final Pokemon pokemon;
  AboutTab({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          width: ResponsiveHelper.instance.width,
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[350],
                blurRadius: 4,
                offset: Offset(0.0, 1.0),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Weight',
                    style: AppTextStyle.smallBold
                        .copyWith(color: Color(0xFFB4B5BE)),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n\n" + pokemon.weight.toString() + " (cm)",
                        style: AppTextStyle.smallBold,
                      )
                    ]),
              ),
              const SizedBox(width: 40),
              RichText(
                text: TextSpan(
                    text: 'Height',
                    style: AppTextStyle.smallBold.copyWith(
                      color: Color(0xFFB4B5BE),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n\n" + pokemon.height.toString() + " (kg)",
                        style: AppTextStyle.smallBold,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
