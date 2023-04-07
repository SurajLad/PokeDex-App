import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pokedex/controllers/home_controller.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/UI/list_page.dart';
import 'package:my_pokedex/widgets/ImageButton.dart';
import 'package:my_pokedex/routes/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController animationController;
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animationController.forward();
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
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
                left: Get.width - 150,
                bottom: (Get.height / 1.35),
                child: RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 1.0).animate(animationController),
                  child: Image.asset(
                    'assets/pokemon_ball.png',
                    width: 230,
                    height: 230,
                    color: Colors.black12,
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 80,
                right: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Hey Trainer,",
                      style: AppTextStyle.smallBold,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "What are you \nare looking for?",
                      style: AppTextStyle.largeBold,
                    ),
                    const SizedBox(height: 30),
                    ImageButton(
                      title: "Pokedex",
                      color: const Color(0xFF36996D).withOpacity(0.9),
                      function: () {
                        Get.toNamed(Routes.POKEDEX);
                      },
                      imgUrl: "assets/poke_ball.png",
                    ),
                    const SizedBox(height: 10),
                    ImageButton(
                      title: "Moves",
                      color: const Color(0xFFC73B37).withOpacity(0.9),
                      function: () {
                        Get.to(
                          ListPage(
                            url: "https://pokeapi.co/api/v2/move/",
                            title: "Moves",
                            description:
                                "Moves are the skills of Pokémon in battle. In battle, a Pokémon uses one move each turn. Some moves (including those learned by Hidden Machine) can be used outside of battle as well, usually for the purpose of removing obstacles or exploring new areas.",
                            type: 0,
                            imgUrl: "assets/poke_move.png",
                          ),
                          curve: Curves.bounceInOut,
                          duration: Duration(milliseconds: 400),
                        );
                      },
                      imgUrl: "assets/poke_move.png",
                    ),
                    const SizedBox(height: 10),
                    ImageButton(
                      title: "Abilities",
                      color: const Color(0xFFEDA926).withOpacity(0.9),
                      function: () {
                        Get.to(
                          ListPage(
                            url: "https://pokeapi.co/api/v2/ability/",
                            title: "Abilities",
                            description:
                                "Abilities provide passive effects for Pokémon in battle or in the overworld. Pokémon have multiple possible abilities but can have only one ability at a time.",
                            type: 1,
                            imgUrl: "assets/poke_abilities.png",
                          ),
                          curve: Curves.bounceInOut,
                          duration: Duration(milliseconds: 400),
                        );
                      },
                      imgUrl: "assets/poke_abilities.png",
                    ),
                    const SizedBox(height: 10),
                    ImageButton(
                      title: "Items",
                      color: const Color(0xFF2E6DD5).withOpacity(0.9),
                      function: () {
                        Get.to(
                          ListPage(
                            url: "https://pokeapi.co/api/v2/item/",
                            title: "Items",
                            description:
                                "An item is an object in the games which the player can pick up, keep in their bag, and use in some manner. They have various uses, including healing, powering up, helping catch Pokémon, or to access a new area.",
                            type: 2,
                            imgUrl: "assets/poke_items.png",
                          ),
                          curve: Curves.bounceInOut,
                          duration: Duration(milliseconds: 400),
                        );
                      },
                      imgUrl: "assets/poke_items.png",
                    ),
                    const SizedBox(height: 10),
                    ImageButton(
                      title: "Region",
                      color: const Color(0xFF4F1091).withOpacity(0.9),
                      function: () {
                        Get.to(
                          ListPage(
                            url: "https://pokeapi.co/api/v2/region/",
                            title: "Regions",
                            description:
                                "A region is an organized area of the Pokémon world. Most often, the main difference between regions is the species of Pokémon that can be encountered within them.",
                            type: 4,
                            imgUrl: "assets/poke_region.png",
                          ),
                          curve: Curves.bounceInOut,
                          duration: Duration(milliseconds: 400),
                        );
                      },
                      imgUrl: "assets/poke_region.png",
                    ),
                    const SizedBox(height: 10),
                    ImageButton(
                      title: "Type",
                      color: const Color(0xFF4C2E3C).withOpacity(0.9),
                      function: () {
                        Get.to(
                          ListPage(
                            url: "https://pokeapi.co/api/v2/type/",
                            title: "Type",
                            description:
                                "Types are properties for Pokémon and their moves. Each type has three properties: which types of Pokémon it is super effective against, which types of Pokémon it is not very effective against, and which types of Pokémon it is completely ineffective against.",
                            type: 3,
                            imgUrl: "assets/poke_region.png",
                          ),
                          curve: Curves.bounceInOut,
                          duration: Duration(milliseconds: 400),
                        );
                      },
                      imgUrl: "assets/pokemon_ball.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
