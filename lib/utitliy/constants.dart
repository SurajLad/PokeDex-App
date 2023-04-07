import 'package:flutter/material.dart';

const Color appThemeColor = Color(0xFFEAEBF5);
const String FONT = "Quicksand-Regular";

class _Image extends AssetImage {
  const _Image(String fileName) : super('assets/$fileName');
}

class AppImages {
  static const loadingGif = _Image("loading.gif");
  static const pokeBall = _Image("poke_ball.png");

  static Future preCacheAssets(BuildContext context) async {
    await precacheImage(loadingGif, context);
    await precacheImage(pokeBall, context);
  }
}

const Map<String, Color> pokemonTypeMap = {
  "Grass": Color(0xFF78C850),
  "Poison": Color(0xFF98558e),
  "Fire": Color(0xFFFB6C6C),
  "Flying": Color(0xFFA890F0),
  "Bug": Color(0xFF48D0B0),
  "Water": Color(0xFF7AC7FF),
  "Normal": Color(0xFFbcbcad),
  "Ground": Color(0xFFeece5a),
  "Fairy": Color(0xFFf9acff),
  "Electric": Color(0xFFfee53c),
  "Fighting": Color(0xFFa75544),
  "Psychic": Color(0xFFf160aa),
  "Rock": Color(0xFFcebd74),
  "Steel": Color(0xFFc4c2db),
  "Ice": Color(0xFF96f1ff),
  "Ghost": Color(0xFF7C538C),
  "Dragon": Color(0xD07038F8),
  "Dark": Color(0xFF8f6955),
};
