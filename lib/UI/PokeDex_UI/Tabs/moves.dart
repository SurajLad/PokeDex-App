import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_pokedex/controllers/pokemon_controller.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';

class MovesTab extends StatelessWidget {
  final PokemonController pokemonController = Get.find<PokemonController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: GetBuilder<PokemonController>(
        builder: (_) {
          return pokemonController.pokemonAPI != null
              ? ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pokemonController.pokemonAPI.moves.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[350],
                            blurRadius: 4,
                            offset: Offset(0.0, 1.0),
                          )
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(LineIcons.dot_circle_o, size: 30),
                          const SizedBox(width: 20),
                          Text(
                            pokemonController
                                .pokemonAPI.moves[index].move.name.capitalize
                                .replaceAll("-", " "),
                            style: AppTextStyle.smallBold,
                          ),
                        ],
                      ),
                    );
                  },
                )
              : SpinKitCircle(
                  color: Colors.red,
                  size: 40.0,
                );
        },
      ),
    );
  }
}
