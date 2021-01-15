import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex/Helpers/constants.dart';
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
        border: Border.all(color: Colors.black38),
        // borderRadius: BorderRadius.circular(10),
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
            child: Text(pokemon.name),
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
