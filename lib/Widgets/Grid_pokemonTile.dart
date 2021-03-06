import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/UI/PokeDex_UI/pokemon_detail.dart';
import 'package:my_pokedex/utitliy/constants.dart';
import 'package:my_pokedex/Model/pokemon.dart';

class GridPokemonTile extends StatelessWidget {
  final int index;
  final Pokemon pokemon;

  GridPokemonTile({this.index, this.pokemon});

  static const double _pokeballFraction = 0.75;
  static const double _pokemonFraction = 0.74;

  Widget _buildPokeballDecoration({@required double height}) {
    final pokeballSize = height * _pokeballFraction;

    return Positioned(
      bottom: -height * 0.13,
      right: -height * 0.03,
      child: Image(
        image: AppImages.pokeBall,
        width: pokeballSize,
        height: pokeballSize,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }

  Widget _buildPokemon({@required double height}) {
    final pokemonSize = height * _pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: Hero(
        tag: pokemon.id,
        child: CachedNetworkImageBuilder(
          url: "https://pokeres.bastionbot.org/images/pokemon/$index.png",
          builder: (image) {
            return Image.file(
              image,
              fit: BoxFit.contain,
              width: pokemonSize,
              height: pokemonSize,
            );
          },
          placeHolder: SizedBox(
            width: pokemonSize,
            height: pokemonSize,
            child: Image(
              image: AppImages.loadingGif,
              color: Colors.black12,
            ),
          ),
          errorWidget: const Image(
            image: AppImages.pokeBall,
          ),
          imageExtensions: ['jpg', 'png'],
        ),
      ),
    );
  }

  Widget _buildPokemonNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        "#" + pokemon.dex.toString(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;
        return Container(
          decoration: BoxDecoration(
            color: pokemonTypeMap[pokemon.types[0].name],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: pokemonTypeMap[pokemon.types[0].name].withOpacity(0.12),
                blurRadius: 30,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: pokemonTypeMap[pokemon.types[0].name],
              child: InkWell(
                onTap: () {
                  Get.to(
                    PokemonDetail(pokemon: pokemon),
                    duration: Duration(milliseconds: 600),
                  );
                },
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildPokeballDecoration(height: itemHeight),
                    _buildPokemon(height: itemHeight),
                    _buildPokemonNumber(),
                    _CardContent(pokemon),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent(this.pokemon, {Key key}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              tag: pokemon.id + pokemon.name,
              child: Text(
                pokemon.name,
                style: TextStyle(
                  fontSize: ResponsiveHelper.instance.fontSize - 4,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
