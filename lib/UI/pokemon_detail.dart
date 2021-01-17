import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/pokemon.dart';
import 'package:my_pokedex/UI/Tabs/about.dart';
import 'package:my_pokedex/utitliy/constants.dart';

class PokemonDetail extends StatefulWidget {
  final Pokemon pokemon;
  PokemonDetail({this.pokemon});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
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
              // Positioned(
              //   left: ResponsiveHelper.instance.width - 160,
              //   bottom: (ResponsiveHelper.instance.height / 1.45),
              //   child: Image.asset(
              //     'Assets/poke_ball.png',
              //     width: 230,
              //     height: 230,
              //   ),
              // ),
              Positioned(
                left: 30,
                top: 50,
                right: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.pokemon.name,
                          style: AppTextStyle.largeBold.copyWith(
                            color: Colors.white,
                            fontSize:
                                ResponsiveHelper.instance.titleFontSize + 8,
                          ),
                        ),
                        Text(
                          "#" + widget.pokemon.dex.toString(),
                          style: AppTextStyle.regularBold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
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
                              color: Colors.white24,
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
                  ],
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
                        tabs: [
                          Tab(
                            text: "About",
                          ),
                          Tab(
                            text: "Base Stats",
                          ),
                          Tab(
                            text: "Evolution",
                          ),
                          Tab(
                            text: "Moves",
                          ),
                        ],
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            AboutTab(
                              pokemon: widget.pokemon,
                            ),
                            Text('Person'),
                            Text('Person'),
                            Text('Person'),
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
                child: SizedBox(
                  width: ResponsiveHelper.instance.width / 1.85,
                  height: ResponsiveHelper.instance.width / 1.85,
                  child: CachedNetworkImageBuilder(
                    url: "https://pokeres.bastionbot.org/images/pokemon/" +
                        widget.pokemon.dex.toString() +
                        ".png",
                    builder: (image) {
                      return Image.file(image);
                    },
                    placeHolder: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('Assets/loading.gif'),
                    ),
                    errorWidget: Image.asset('Assets/poke_ball.png'),
                    imageExtensions: ['jpg', 'png'],
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
