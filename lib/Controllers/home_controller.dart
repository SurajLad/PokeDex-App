import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Model/news.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:my_pokedex/Model/pokemon.dart';

class HomeController extends GetxController {
  TextEditingController filterTxtController = TextEditingController();
  News news;
  List<Pokemon> pokemonList = [], searchList = [];

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

  onDataSearched() {
    searchList = pokemonList
        .where((string) => string.name
            .toLowerCase()
            .contains(filterTxtController.text.toLowerCase()))
        .toList();
    update();
  }

  void getData() async {
    parseJsonFromAssets("Assets/pokemon.json").then((dmap) {
      pokemonList = pokemonFromJson(json.encode(dmap));
      searchList = pokemonList;
    });
    news = await APIHelper().getNews();
    update();
  }
}
