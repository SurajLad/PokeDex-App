import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Model/Move_details.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';
import 'package:my_pokedex/utitliy/constants.dart';

class MoveDetails extends StatefulWidget {
  final String url;
  MoveDetails({this.url});
  @override
  _MoveDetailsState createState() => _MoveDetailsState();
}

class _MoveDetailsState extends State<MoveDetails> {
  MoveDetail moveDetails;
  @override
  void initState() {
    getMoveDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 0),
      decoration: BoxDecoration(),
      child: moveDetails != null
          ? Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "Assets/pokemon_type_icons/" +
                          moveDetails.type.name.capitalizeFirst +
                          ".svg",
                      color:
                          pokemonTypeMap[moveDetails.type.name.capitalizeFirst],
                      placeholderBuilder: (context) =>
                          Image.asset('Assets/poke_ball.png'),
                      width: 90,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      moveDetails.name.capitalizeFirst.replaceAll('-', " "),
                      style: AppTextStyle.extraLargeBold,
                    ),
                    const SizedBox(height: 15),
                    buildAboutInformation(
                        "Type", moveDetails.type.name.capitalizeFirst),
                    const SizedBox(height: 5),
                    buildAboutInformation(
                        "Accuracy", moveDetails.accuracy.toString()),
                    const SizedBox(height: 5),
                    buildAboutInformation("PP", moveDetails.pp.toString()),
                    const SizedBox(height: 5),
                    buildAboutInformation(
                        "Power", moveDetails.power.toString()),
                    const SizedBox(height: 5),
                    buildAboutInformation(
                        "Priority", moveDetails.priority.toString()),
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
                        moveDetails.meta.flinchChance.toString()),
                    const SizedBox(height: 5),
                    buildAboutInformation(
                        "Healing", moveDetails.meta.healing.toString()),
                    const SizedBox(height: 5),
                    buildAboutInformation(
                        "Stat chance", moveDetails.meta.statChance.toString()),
                    const SizedBox(height: 5),
                    buildAboutInformation(
                        "Crit rate ", moveDetails.meta.critRate.toString()),
                  ],
                ),
              ],
            )
          : SpinKitCircle(
              color: Colors.red,
              size: 40.0,
            ),
    );
  }

  void getMoveDetails() async {
    moveDetails = await APIHelper().getMoveDetail(widget.url);
    setState(() {});
  }

  Row buildAboutInformation(String title, String information) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            title,
            style: AppTextStyle.smallBold.copyWith(color: Color(0xFFB4B5BE)),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            ":\t\t\t" + information,
            style: AppTextStyle.smallBold,
          ),
        ),
      ],
    );
  }
}
