import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';
import 'package:my_pokedex/Model/ability_detail.dart';
import 'package:my_pokedex/utitliy/constants.dart';

class AbilityDetailSheet extends StatefulWidget {
  final String url;
  AbilityDetailSheet({this.url});
  @override
  _AbilityDetailSheetState createState() => _AbilityDetailSheetState();
}

class _AbilityDetailSheetState extends State<AbilityDetailSheet> {
  AbilityDetail abilityDetail;
  String description = "";

  @override
  void initState() {
    getAbilityDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 1,
      expand: false,
      builder: (context, scrollController) => abilityDetail != null
          ? Container(
              margin: const EdgeInsets.only(left: 30, right: 10),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      abilityDetail.name.capitalizeFirst.replaceAll('-', " "),
                      style: AppTextStyle.extraLargeBold
                          .copyWith(color: Color(0xFFB4B5BE)),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description,
                      style: AppTextStyle.smallBold,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Pokemons",
                      style: AppTextStyle.largeBold
                          .copyWith(color: Color(0xFFB4B5BE)),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "A list of Pokémon that could potentially have this ability.",
                      style: AppTextStyle.smallBold,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: abilityDetail.pokemon.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 90,
                                margin: const EdgeInsets.only(
                                    right: 12.0, bottom: 10.0),
                                child: CachedNetworkImageBuilder(
                                  url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/" +
                                      abilityDetail.pokemon[index].pokemon.url
                                          .replaceAll(
                                              "https://pokeapi.co/api/v2/pokemon/",
                                              "")
                                          .replaceAll("/", "") +
                                      ".png",
                                  builder: (image) {
                                    return Image.file(image);
                                  },
                                  placeHolder: SizedBox(
                                    width: 90,
                                    height: 90,
                                    child: Image.asset('assets/loading.gif'),
                                  ),
                                  errorWidget:
                                      Image.asset('assets/poke_ball.png'),
                                  imageExtensions: ['jpg', 'png'],
                                ),
                              ),
                              Text(abilityDetail.pokemon[index].pokemon.name),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
              child: Image(
                image: AppImages.loadingGif,
                height: 140,
              ),
            ),
    );
  }

  void getAbilityDetails() async {
    abilityDetail = await APIHelper().getAbilityDetail(widget.url);
    abilityDetail.effectEntries.forEach((element) {
      element.language.name == "en"
          ? description = element.effect
          : description = "";
    });
    setState(() {});
  }
}
