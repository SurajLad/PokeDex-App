import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/UI/PokeDex_UI/pokemon_detail.dart';
import 'package:my_pokedex/utitliy/constants.dart';
import 'package:my_pokedex/Model/pokemon.dart';

class PokemonTile extends StatelessWidget {
  final int index;
  final Pokemon pokemon;

  PokemonTile({this.index, this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PokemonDetail(pokemon: pokemon),
            duration: Duration(milliseconds: 700));
      },
      child: Hero(
        tag: pokemon.id,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          height: 80,
          decoration: BoxDecoration(
            color: pokemonTypeMap[pokemon.types[0].name].withOpacity(0.7),
            //   border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: CachedNetworkImageBuilder(
                    url:
                        "https://pokeres.bastionbot.org/images/pokemon/$index.png",
                    builder: (image) {
                      return Center(child: Image.file(image));
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 110.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name,
                      style: AppTextStyle.regularBold
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 25,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: pokemon.types.length,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: SvgPicture.asset(
                              "Assets/pokemon_type_icons/" +
                                  pokemon.types[index].name +
                                  ".svg",
                              color: pokemonTypeMap[pokemon.types[index].name],
                              placeholderBuilder: (context) =>
                                  Image.asset('Assets/poke_ball.png'),
                              width: 20,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 2),
                  child: Text(
                    "#" + index.toString(),
                    style: AppTextStyle.largeBold.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
