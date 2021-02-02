import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Controllers/pokemon_controller.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/utitliy/utils.dart';

class StatsTab extends StatelessWidget {
  final PokemonController pokemonController = Get.find<PokemonController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: ListView.builder(
        itemCount: pokemonController.pokemonAPI.stats.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getStatString(pokemonController
                            .pokemonAPI.stats[index].stat.name),
                        style: AppTextStyle.smallBold
                            .copyWith(color: Color(0xFFB4B5BE)),
                      ),
                      Text(
                        pokemonController.pokemonAPI.stats[index].baseStat
                            .toString(),
                        style: AppTextStyle.smallBold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  flex: 5,
                  child: LinearProgressIndicator(
                    value: pokemonController.pokemonAPI.stats[index].baseStat /
                        100,
                    valueColor: getStatsColor(
                        pokemonController.pokemonAPI.stats[index].baseStat),
                    backgroundColor: Color(0xFFB4B5BE).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
