import 'dart:ffi';

import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Controllers/home_controller.dart';
import 'package:my_pokedex/Controllers/pokemon_controller.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/pokemon.dart';
import 'package:my_pokedex/utitliy/utils.dart';

class EvolutionTab extends StatelessWidget {
  final Pokemon pokemon;
  final PokemonController pokemonController = Get.find<PokemonController>();
  final HomeController homeController = Get.find<HomeController>();

  EvolutionTab({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          pokemon.evolution.futureBranches != null
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pokemon.evolution.futureBranches.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: CachedNetworkImageBuilder(
                                      url:
                                          "https://pokeres.bastionbot.org/images/pokemon/" +
                                              getDexFromName(
                                                      pokemon.name,
                                                      homeController
                                                          .pokemonList)
                                                  .toString() +
                                              ".png",
                                      builder: (image) {
                                        return Image.file(image);
                                      },
                                      placeHolder: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child:
                                            Image.asset('Assets/loading.gif'),
                                      ),
                                      errorWidget:
                                          Image.asset('Assets/poke_ball.png'),
                                      imageExtensions: ['jpg', 'png'],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    pokemon.name,
                                    style: AppTextStyle.smallBold,
                                  )
                                ],
                              ),
                              SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.asset('Assets/loading.gif')),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: CachedNetworkImageBuilder(
                                      url:
                                          "https://pokeres.bastionbot.org/images/pokemon/" +
                                              getDexFromName(
                                                      pokemon
                                                          .evolution
                                                          .futureBranches[index]
                                                          .name,
                                                      homeController
                                                          .pokemonList)
                                                  .toString() +
                                              ".png",
                                      builder: (image) {
                                        return Image.file(image);
                                      },
                                      placeHolder: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child:
                                            Image.asset('Assets/loading.gif'),
                                      ),
                                      errorWidget:
                                          Image.asset('Assets/poke_ball.png'),
                                      imageExtensions: ['jpg', 'png'],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    pokemon
                                        .evolution.futureBranches[index].name,
                                    style: AppTextStyle.smallBold,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        buildFutureEvolutions(index),
                      ],
                    );
                  },
                )
              : Container(
                  margin: const EdgeInsets.only(top: 40),
                  alignment: Alignment.center,
                  child: Text("No Evolution Found"),
                )
        ],
      ),
    );
  }

  Widget buildFutureEvolutions(int index) {
    if (pokemon.evolution.futureBranches[index].futureBranches != null) {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:
            pokemon.evolution.futureBranches[index].futureBranches.length,
        itemBuilder: (context, inIndex) {
          return Container(
            padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CachedNetworkImageBuilder(
                        url: "https://pokeres.bastionbot.org/images/pokemon/" +
                            getDexFromName(
                                    pokemon
                                        .evolution.futureBranches[index].name,
                                    homeController.pokemonList)
                                .toString() +
                            ".png",
                        builder: (image) {
                          return Image.file(image);
                        },
                        placeHolder: SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset('Assets/loading.gif'),
                        ),
                        errorWidget: Image.asset('Assets/poke_ball.png'),
                        imageExtensions: ['jpg', 'png'],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      pokemon.evolution.futureBranches[index].name,
                      style: AppTextStyle.smallBold,
                    )
                  ],
                ),
                SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset('Assets/loading.gif')),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CachedNetworkImageBuilder(
                        url: "https://pokeres.bastionbot.org/images/pokemon/" +
                            getDexFromName(
                                    pokemon.evolution.futureBranches[index]
                                        .futureBranches[inIndex].name,
                                    homeController.pokemonList)
                                .toString() +
                            ".png",
                        builder: (image) {
                          return Image.file(image);
                        },
                        placeHolder: SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset('Assets/loading.gif'),
                        ),
                        errorWidget: Image.asset('Assets/poke_ball.png'),
                        imageExtensions: ['jpg', 'png'],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      pokemon.evolution.futureBranches[index]
                          .futureBranches[inIndex].name,
                      style: AppTextStyle.smallBold,
                    )
                  ],
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
