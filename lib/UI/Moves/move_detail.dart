import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/Move_details.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';
import 'package:my_pokedex/utitliy/constants.dart';

class MoveDetailSheet extends StatefulWidget {
  final String url;
  MoveDetailSheet({this.url});
  @override
  _MoveDetailSheetState createState() => _MoveDetailSheetState();
}

class _MoveDetailSheetState extends State<MoveDetailSheet> {
  MoveDetail moveDetails;
  @override
  void initState() {
    getMoveDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1,
        expand: false,
        builder: (context, scrollController) {
          return moveDetails != null
              ? Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8, 18, 8),
                        child: SvgPicture.asset(
                          "Assets/pokemon_type_icons/" +
                              moveDetails.type.name.capitalizeFirst +
                              ".svg",
                          color: pokemonTypeMap[
                              moveDetails.type.name.capitalizeFirst],
                          placeholderBuilder: (context) =>
                              Image.asset('Assets/poke_ball.png'),
                          width: 90,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            moveDetails.name.capitalizeFirst
                                .replaceAll('-', " "),
                            style: AppTextStyle.extraLargeBold.copyWith(
                              color: Color(0xFFe94a41),
                            ),
                          ),
                          const SizedBox(height: 25),
                          buildAboutInformation(
                              "Type", moveDetails.type.name.capitalizeFirst),
                          const SizedBox(height: 5),
                          buildAboutInformation(
                              "Accuracy", moveDetails.accuracy.nullCheck),
                          const SizedBox(height: 5),
                          buildAboutInformation(
                              "PP", moveDetails.pp.toString()),
                          const SizedBox(height: 5),
                          buildAboutInformation(
                              "Power", moveDetails.power.nullCheck),
                          const SizedBox(height: 5),
                          buildAboutInformation(
                              "Priority", moveDetails.priority.nullCheck),
                          const SizedBox(height: 15),
                          Text(
                            "Other Information",
                            style: AppTextStyle.smallBold,
                          ),
                          const SizedBox(height: 15),
                          buildAboutInformation("Contest Type",
                              moveDetails.contestType.name.capitalizeFirst),
                          const SizedBox(height: 5),
                          buildAboutInformation("Damage class",
                              moveDetails.damageClass.name.capitalizeFirst),
                          const SizedBox(height: 5),
                          buildAboutInformation("Flinch chance",
                              moveDetails.meta.flinchChance.nullCheck),
                          const SizedBox(height: 5),
                          buildAboutInformation(
                              "Healing", moveDetails.meta.healing.nullCheck),
                          const SizedBox(height: 5),
                          buildAboutInformation("Stat chance",
                              moveDetails.meta.statChance.nullCheck),
                          const SizedBox(height: 5),
                          buildAboutInformation("Crit rate ",
                              moveDetails.meta.critRate.nullCheck),
                        ],
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                  child: Image(
                    image: AppImages.loadingGif,
                    height: 140,
                  ),
                );
        });
  }

  void getMoveDetails() async {
    moveDetails = await APIHelper().getMoveDetail(widget.url);
    setState(() {});
  }
}
