import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/Controllers/home_controller.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Widgets/PokemonTile.dart';

class PokeDexList extends StatefulWidget {
  @override
  _PokeDexListState createState() => _PokeDexListState();
}

class _PokeDexListState extends State<PokeDexList> {
  HomeController homeController = Get.find<HomeController>();
  //   https://medium.com/@sergio13prez/fetching-them-all-poke-api-62ca580981a2

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Positioned(
                left: Get.width - 160,
                bottom: (Get.height / 1.45),
                child: Image.asset(
                  'Assets/poke_ball.png',
                  width: 230,
                  height: 230,
                ),
              ),
              Positioned(
                left: 30,
                top: 50,
                right: 25,
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Pokedex",
                        style: AppTextStyle.largeBold
                            .copyWith(color: Color(0xFFe94a41)),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: Get.width,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAEBF5),
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: homeController.filterTxtController,
                          onChanged: (value) {
                            homeController.onDataSearched();
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(4),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black54,
                            ),
                            hintText: "Search Pokemon.",
                            hintStyle: AppTextStyle.smallBold.copyWith(
                              color: Color(0xFF827A7D),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "This Pokedex contains detailed stats for every pokemon.",
                        style: AppTextStyle.regularBold.copyWith(
                          color: Color(0xFF827A7D),
                          fontSize: ResponsiveHelper.instance.fontSize - 4,
                        ),
                      ),
                      GetBuilder<HomeController>(
                        builder: (controller) => Expanded(
                          child: ListView.builder(
                            primary: false,
                            itemCount: homeController.searchList.length,
                            itemBuilder: (_, index) {
                              return PokemonTile(
                                //    index: index + 1,
                                index: homeController.searchList[index].dex,
                                pokemon: homeController.searchList[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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
