import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_pokedex/Controllers/pokemon_controller.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';
import 'package:my_pokedex/Model/pokemon.dart';

class AboutTab extends StatelessWidget {
  final Pokemon pokemon;
  final PokemonController pokemonController = Get.find<PokemonController>();

  AboutTab({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topCenter,
      child: GetBuilder<PokemonController>(
        builder: (_) {
          return pokemonController.pokemonAPI != null
              ? Column(
                  children: [
                    const SizedBox(height: 10),
                    pokemon.encounter.gender != null
                        ? Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Gender  :",
                                style: AppTextStyle.smallBold
                                    .copyWith(color: Color(0xFFB4B5BE)),
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
                                      (pokemon.encounter.gender.malePercent *
                                                  100)
                                              .toString() +
                                          "%",
                                      style: AppTextStyle.smallBold,
                                    ),
                                    const SizedBox(width: 10),
                                    Icon(
                                      LineIcons.venus,
                                      color: Color(0xFFd68998),
                                    ),
                                    Text(
                                      (pokemon.encounter.gender.femalePercent *
                                                  100)
                                              .toString() +
                                          "%",
                                      style: AppTextStyle.smallBold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    const SizedBox(height: 15),
                    buildAboutInformation("MaxCP", pokemon.maxCp.toString()),
                    const SizedBox(height: 15),
                    buildAboutInformation("Base XP",
                        pokemonController.pokemonAPI.baseExperience.toString()),
                    const SizedBox(height: 15),
                    buildAboutInformation(
                        "Weight", pokemon.weight.toString() + " (kg)"),
                    const SizedBox(height: 15),
                    buildAboutInformation(
                        "Height", pokemon.height.toString() + " (m)"),
                  ],
                )
              : Image.asset('Assets/loading.gif');
        },
      ),
    );
  }

  // // Row buildAboutInformation(String title, String information) {
  // //   return Row(
  // //     mainAxisSize: MainAxisSize.max,
  // //     children: [
  // //       Flexible(
  // //         flex: 4,
  // //         child: Text(
  // //           title + "\t\t:",
  // //           style: AppTextStyle.smallBold.copyWith(color: Color(0xFFB4B5BE)),
  // //         ),
  // //       ),
  // //       Flexible(
  // //         fit: FlexFit.tight,
  // //         flex: 6,
  // //         child: Align(
  // //           alignment: Alignment.center,
  // //           child: Text(
  // //             information,
  // //             style: AppTextStyle.smallBold,
  // //           ),
  // //         ),
  // //       ),
  // //     ],
  // //   );
  // }
}
