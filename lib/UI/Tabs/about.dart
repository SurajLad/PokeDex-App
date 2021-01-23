import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/pokemon.dart';

class AboutTab extends StatelessWidget {
  final Pokemon pokemon;
  AboutTab({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: ResponsiveHelper.instance.width,
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
          const SizedBox(height: 15),
          Text(
            "Breeding",
            style: AppTextStyle.smallBold,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Gender",
                style:
                    AppTextStyle.smallBold.copyWith(color: Color(0xFFB4B5BE)),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LineIcons.mars,
                      color: Color(0xFF7d7d9a),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      (pokemon.encounter.gender.malePercent * 100).toString() +
                          "%",
                      style: AppTextStyle.smallBold,
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      LineIcons.venus,
                      color: Color(0xFFd68998),
                    ),
                    Text(
                      (pokemon.encounter.gender.femalePercent * 100)
                              .toString() +
                          "%",
                      style: AppTextStyle.smallBold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
