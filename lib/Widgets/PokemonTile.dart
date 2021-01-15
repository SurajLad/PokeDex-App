import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/utitliy/constants.dart';
import 'package:my_pokedex/Model/pokemon.dart';

class PokemonTile extends StatelessWidget {
  final int index;
  final Pokemon pokemon;

  PokemonTile({this.index, this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      height: 80,
      decoration: BoxDecoration(
        color: pokemonTypeMap[pokemon.types[0].name].withOpacity(0.6),
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
                url: "https://pokeres.bastionbot.org/images/pokemon/$index.png",
                builder: (image) {
                  return Center(child: Image.file(image));
                },
                placeHolder: CircularProgressIndicator(),
                errorWidget: Image.asset('assets/images/error_image.png'),
                imageExtensions: ['jpg', 'png'],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pokemon.name),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 25,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: pokemon.types.length,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          "Assets/pokemon_type_icons/" +
                              pokemon.types[index].name +
                              ".svg",
                          width: 25,
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
              child: Text("#" + index.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
