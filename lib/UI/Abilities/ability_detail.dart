import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:flutter/material.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';
import 'package:my_pokedex/Model/ability_detail.dart';

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
    return Container(
      child: abilityDetail != null
          ? Container(
              margin: const EdgeInsets.only(left: 30, right: 10),
              child: SingleChildScrollView(
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
                      "Pokemon",
                      style: AppTextStyle.extraLargeBold
                          .copyWith(color: Color(0xFFB4B5BE)),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 500,
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: abilityDetail.pokemon.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 90,
                                margin: const EdgeInsets.only(
                                    right: 12.0, bottom: 10.0),
                                child: CachedNetworkImageBuilder(
                                  url: "https://pokeres.bastionbot.org/images/pokemon/" +
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
                                    child: Image.asset('Assets/loading.gif'),
                                  ),
                                  errorWidget:
                                      Image.asset('Assets/poke_ball.png'),
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
              child: Image.asset('Assets/loading.gif', height: 140),
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
