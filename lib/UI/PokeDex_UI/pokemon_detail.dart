import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_pokedex/controllers/pokemon_controller.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/pokemon.dart';
import 'package:my_pokedex/UI/PokeDex_UI/Tabs/about.dart';
import 'package:my_pokedex/UI/PokeDex_UI/Tabs/evolution.dart';
import 'package:my_pokedex/UI/PokeDex_UI/Tabs/moves.dart';
import 'package:my_pokedex/UI/PokeDex_UI/Tabs/stats.dart';
import 'package:my_pokedex/utitliy/constants.dart';

class PokemonDetail extends StatefulWidget {
  final Pokemon pokemon;
  PokemonDetail({this.pokemon});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail>
    with TickerProviderStateMixin {
  TabController _tabController;
  AnimationController animationController;
  PokemonController pokemonController = Get.put(PokemonController());

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    pokemonController.getPokemonDetails(widget.pokemon.dex.toString());
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
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemonTypeMap[widget.pokemon.types[0].name],
      body: SingleChildScrollView(
        child: Container(
          width: ResponsiveHelper.instance.width,
          height: ResponsiveHelper.instance.height,
          child: Stack(
            children: [
              Positioned(
                left: ResponsiveHelper.instance.width - 160,
                bottom: (ResponsiveHelper.instance.height / 1.35),
                child: RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 1.0).animate(animationController),
                  child: Image.asset(
                    'assets/pokemon_ball.png',
                    width: 230,
                    height: 230,
                    color: Colors.white24,
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 35,
                right: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        LineIcons.arrow_left,
                        color: Colors.white,
                      ),
                      iconSize: 30,
                    ),
                    Text(
                      widget.pokemon.name,
                      style: AppTextStyle.largeBold.copyWith(
                        color: Colors.white,
                        fontSize: ResponsiveHelper.instance.titleFontSize + 8,
                      ),
                    ),
                    Text(
                      "#" + widget.pokemon.dex.toString(),
                      style: AppTextStyle.extraLargeBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: 95,
                right: 25,
                child: SizedBox(
                  height: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.pokemon.types.length,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color:
                              pokemonTypeMap[widget.pokemon.types[index].name],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.pokemon.types[index].name,
                          style: AppTextStyle.smallBold
                              .copyWith(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 130 + (ResponsiveHelper.instance.width / 1.85),
                child: Container(
                  width: ResponsiveHelper.instance.width,
                  height: ResponsiveHelper.instance.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      TabBar(
                        unselectedLabelColor: Colors.black54,
                        labelColor: Colors.black,
                        labelStyle: AppTextStyle.small.copyWith(
                          fontSize: ResponsiveHelper.instance.fontSize - 6,
                          fontWeight: FontWeight.bold,
                        ),
                        indicatorColor: Color(0xFF4C2E3C),
                        unselectedLabelStyle: AppTextStyle.small.copyWith(
                          fontSize: ResponsiveHelper.instance.fontSize - 6,
                        ),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: Color(0xFF4C2E3C),
                            width: 2,
                          ),
                          insets: const EdgeInsets.only(left: 25, right: 25),
                        ),
                        tabs: [
                          Tab(text: "About"),
                          Tab(text: "Base Stats"),
                          Tab(text: "Evolution"),
                          Tab(text: "Moves"),
                        ],
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            AboutTab(pokemon: widget.pokemon),
                            StatsTab(),
                            EvolutionTab(pokemon: widget.pokemon),
                            MovesTab(),
                          ],
                          controller: _tabController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: ResponsiveHelper.instance.width / 4.5,
                child: Hero(
                  tag: widget.pokemon.id,
                  child: SizedBox(
                    width: ResponsiveHelper.instance.width / 1.85,
                    height: ResponsiveHelper.instance.width / 1.85,
                    child: CachedNetworkImageBuilder(
                      url:
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/" +
                              widget.pokemon.dex.toString() +
                              ".png",
                      builder: (image) {
                        return Image.file(image);
                      },
                      placeHolder: SizedBox(
                        height: 20,
                        width: 20,
                        child: const Image(
                          image: AppImages.loadingGif,
                        ),
                      ),
                      errorWidget: const Image(
                        image: AppImages.pokeBall,
                      ),
                      imageExtensions: ['jpg', 'png'],
                    ),
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
