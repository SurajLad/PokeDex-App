import 'package:get/get.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Model/news.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:my_pokedex/Model/pokemon.dart';

class HomeController extends GetxController {
  News news;
  List<Pokemon> pokemonList = [];

  Future<List<dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getData() async {
    news = await APIHelper().getNews();
    parseJsonFromAssets("Assets/pokemon.json").then((dmap) {
      pokemonList = pokemonFromJson(json.encode(dmap));
      print(pokemonList[0].name);
    });
    update();
  }
}
