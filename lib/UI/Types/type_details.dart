import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_pokedex/Helpers/api_helper.dart';
import 'package:my_pokedex/Helpers/responsive_helper.dart';
import 'package:my_pokedex/Helpers/text_styles.dart';
import 'package:my_pokedex/Helpers/utility_helpers.dart';
import 'package:my_pokedex/models/type.dart';
import 'package:my_pokedex/utitliy/constants.dart';

class TypeDetailsSheet extends StatefulWidget {
  final String url;
  TypeDetailsSheet({this.url});
  @override
  _TypeDetailsSheetState createState() => _TypeDetailsSheetState();
}

class _TypeDetailsSheetState extends State<TypeDetailsSheet> {
  TypeDetail typeDetail;
  String description = "";

  @override
  void initState() {
    gettypeDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 1,
      expand: false,
      builder: (context, scrollController) => typeDetail != null
          ? Container(
              margin: const EdgeInsets.only(left: 30, right: 10),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      typeDetail.name.capitalizeFirst.replaceAll('-', " "),
                      style: AppTextStyle.extraLargeBold
                          .copyWith(color: Color(0xFFe94a41)),
                    ),
                    const SizedBox(height: 20),
                    buildDamageWidget(
                      title: "Double Damage\nFrom : ",
                      list: typeDetail.damageRelations.doubleDamageFrom,
                    ),
                    const SizedBox(height: 20),
                    buildDamageWidget(
                      title: "Double Damage\nTo : ",
                      list: typeDetail.damageRelations.doubleDamageTo,
                    ),
                    const SizedBox(height: 20),
                    buildDamageWidget(
                      title: "Half Damage\From : ",
                      list: typeDetail.damageRelations.halfDamageFrom,
                    ),
                    const SizedBox(height: 20),
                    buildDamageWidget(
                      title: "Half Damage\nTo : ",
                      list: typeDetail.damageRelations.halfDamageTo,
                    ),
                    const SizedBox(height: 20),
                    buildDamageWidget(
                      title: "No Damage\nFrom : ",
                      list: typeDetail.damageRelations.noDamageFrom,
                    ),
                    const SizedBox(height: 20),
                    buildDamageWidget(
                      title: "No Damage\nTo : ",
                      list: typeDetail.damageRelations.noDamageTo,
                    ),
                    const SizedBox(height: 20),
                    buildAboutInformation("Damage Type",
                        typeDetail.moveDamageClass.name.capitalizeFirst),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
              child: Image.asset(
                'Assets/loading.gif',
                height: 140,
              ),
            ),
    );
  }

  Row buildDamageWidget({String title, var list}) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            title.capitalizeFirst,
            style: AppTextStyle.regularBold.copyWith(
              color: Color(0xFF827A7D),
              fontSize: ResponsiveHelper.instance.fontSize - 4,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: SizedBox(
            height: 40,
            child: list.isEmpty
                ? Text(
                    "No Data",
                    style: AppTextStyle.smallBold,
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Tooltip(
                        message: list[index].name.toString().capitalizeFirst,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset(
                            "Assets/pokemon_type_icons/" +
                                list[index].name.toString().capitalizeFirst +
                                ".svg",
                            color: pokemonTypeMap[
                                list[index].name.toString().capitalizeFirst],
                            placeholderBuilder: (context) =>
                                Image.asset('Assets/poke_ball.png'),
                            width: 30,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }

  void gettypeDetails() async {
    typeDetail = await APIHelper().getTypeDetail(widget.url);

    setState(() {});
  }
}
