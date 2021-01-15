import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Controllers/home_controller.dart';
import 'package:my_pokedex/utitliy/constants.dart';
import 'package:my_pokedex/Widgets/PokemonTile.dart';

class PokeDexList extends StatefulWidget {
  @override
  _PokeDexListState createState() => _PokeDexListState();
}

class _PokeDexListState extends State<PokeDexList> {
  static const _pageSize = 20;
  HomeController homeController = Get.find<HomeController>();

  // final PagingController<String, Results> _pagingController =
  //     PagingController(firstPageKey: "https://pokeapi.co/api/v2/pokemon/");

  //
  //   https://medium.com/@sergio13prez/fetching-them-all-poke-api-62ca580981a2

  @override
  void initState() {
    // pokemonFromJson(homeController.);
    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    super.initState();
  }

  // Future<void> _fetchPage(String pageUrl) async {
  //   try {
  //     final pokemon = await APIHelper().getPokemon(pageUrl);

  //     if (pokemon.next == null) {
  //       _pagingController.appendLastPage(pokemon.results);
  //     } else {
  //       final nextPageKey = pokemon.next;
  //       _pagingController.appendPage(pokemon.results, nextPageKey);
  //     }
  //   } catch (error) {
  //     _pagingController.error = error;
  //   }
  // }

  @override
  void dispose() {
    //   _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeColor,
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: Get.width - 160,
                  bottom: (Get.height / 2.25),
                  child: Image.asset(
                    'Assets/poke_ball.png',
                    width: 230,
                    height: 230,
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 70,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Pokedex",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                          height: 700,
                          child: ListView.builder(
                            itemCount: homeController.pokemonList.length,
                            itemBuilder: (_, index) {
                              return PokemonTile(
                                index: index + 1,
                                pokemon: homeController.pokemonList[index],
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
